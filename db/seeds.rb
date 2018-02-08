# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
exist_admin = User.where(email: "admin@example.com").first
unless exist_admin
	admin = User.new(email: "admin@example.com",password: "password", role: "admin", first: "admin",last: "user")
	if admin.save
		puts "successfully created" 
	end
end