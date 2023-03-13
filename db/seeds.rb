# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying chapters..."
Chapter.destroy_all
puts "destroying books..."
Book.destroy_all
puts "destroying users..."
User.destroy_all

puts "creating test accounts"
User.create!(email: "test@test.com", password: "123123")
puts "creating books"
Book.create!(title: "tester", summary: "jnasndkjansdkj", category: "fantasy", user: User.last)
puts "creating Chapter"
Chapter.create!(title: "tester", content: "sdkjahsdlugasd", notice: "asdasd", book: Book.last)
