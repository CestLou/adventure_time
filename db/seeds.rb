# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@admin = User.create(name: "BALLZZZZ", email: "jamesthanhderik@example.com",
  password: "offermeajob", password_confirmation: "offermeajob", role: "admin")
