class Exam < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  validates :experience, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :name, presence: true
  validates :questions, presence: true

  def next_question(user)
    if questions.size == user.questions
      nil
    else
      (questions - user.questions).first
    end
  end

  def generate_score(user)
    score = 0
    t = user.questions & questions
    if t.size == 0
      return 'none'
    else
      t.each do |a|
        s = a.solutions & user.solutions
        s.each do |d|
          if d.correct?
            score+=1
          end
        end
      end
      return ((score / questions.size.to_f) * 100).round(2)
    end
  end

  def generate_experience(user)
    (self.experience * (generate_score(user) / 100)).round(1)
  end

  def generate_progress(user)
    ((user.questions.where(exam_id: self.id).length.to_f) / (questions.size)) * 100
  end
end
