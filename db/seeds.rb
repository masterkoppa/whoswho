# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

[ ["John Smith", "test@gmail.com"], 
  ["Test Dummy", "andresruiz2010@gmail.com"],
  ["Testing 123", "jared.rit@gmail.com"], 
  ["Well Shit", "lol@gmail.com"] ].each do |name, email|

  Employee.create(email: email, full_name: name)
end
