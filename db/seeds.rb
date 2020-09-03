# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all

for i in 0...20 do
    gender = (i % 2 == 0) ? "male" : "female"
    User.create(username: Faker::Name.unique.name, password: Faker::Alphanumeric.alpha(number: 10), age: rand(50), gender: gender, location: Faker::Address.city)
    severe = (i % 2 == 0) ? true : false
    Post.create(positive: Faker::Lorem.sentence(word_count: 3), negative: Faker::Lorem.sentence(word_count: 3), severe: severe, category: Faker::SlackEmoji.activity, poster: User.all[i])
    Comment.create(comment: Faker::Lorem.sentence(word_count: 3), rating:rand(1..5), post: Post.all[i], commenter: User.all[rand(User.all.length)])
    Comment.create(comment: Faker::Lorem.sentence(word_count: 3), rating:rand(1..5), post: Post.all[i], commenter: User.all[rand(User.all.length)])
end

