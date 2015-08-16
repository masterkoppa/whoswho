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

email_list = ["andresruiz2010@gmail.com", "test@gmail.com", "jared.rit@gmail.com", "lol@gmail.com"]
name_list  = ["John Smith", "Test Dummy", "Testing 123", "Well Shit"]
image_urls = ["https://masterkoppa.smugmug.com/Featured/i-b3BqvQ2/0/M/DSC_0841-M.jpg", 
              "https://masterkoppa.smugmug.com/Featured/i-NGLSrfZ/0/L/DSC00449-L.jpg",
              "https://masterkoppa.smugmug.com/Featured/i-JzB8Wwn/0/M/DSC_0522-M.jpg"]

# Create 1k Employees
(0..1000).each do |number|
    puts "Employee #{number}"
    email = email_list.sample(1)[0]
    name  = name_list.sample(1)[0]
    image = rand(2) == 0 ? image_urls.sample(1)[0] : nil

    Employee.create(email: email, full_name: name, url: image)
end