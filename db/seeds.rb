# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.exists?(email: 'admin@conductor.com')
  User.create!(email: 'admin@conductor.com', password: 'password', admin: true)
end

unless User.exists?(email: 'viewer@conductor.com')
  User.create!(email: 'viewer@conductor.com', password: 'password')
end

['Vim', 'Internet Explorer'].each do |name|
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A sample project about #{name}")
  end
end

unless State.exists?
  State.create(name: 'New', background: '#0066cc', color: 'white', default: true)
  State.create(name: 'Open', background: '#008000', color: 'white')
  State.create(name: 'Closed', background: '#990000', color: 'white')
  State.create(name: 'Awesome', background: '#663399', color: 'white')
end
