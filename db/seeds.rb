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
Vote.destroy_all

for i in 0...20 do
    gender = (i % 2 == 0) ? "male" : "female"
    user = User.create!(username: Faker::Name.unique.name, password: Faker::Alphanumeric.alpha(number: 10), age: rand(50), gender: gender, location: Faker::Address.city)
    severe = (i % 2 == 0) ? true : false
    
    post = Post.create!(mood_rating: Faker::Lorem.sentence(word_count: 3), mood_length: Faker::Lorem.sentence(word_count: 3), mood_location: Faker::Lorem.sentence(word_count: 3), 
    mood_trigger: Faker::Lorem.sentence(word_count: 3), mood_trigger_detail: Faker::Lorem.sentence(word_count: 3), mood_description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4), mood_purpose: Faker::Lorem.sentence(word_count: 3), mood_title: Faker::Lorem.sentence(word_count: 1), mood_category: Faker::SlackEmoji.activity, mood_category_detail: Faker::Lorem.sentence(word_count: 3), poster_id: user.id, poster_name: user.username)
    
    Comment.create(comment: Faker::Lorem.sentence(word_count: 3), post: post, commenter_id: user.id)
    Comment.create(comment: Faker::Lorem.sentence(word_count: 3), post: post, commenter_id: user.id)
end

Post.all.each do |post|
    post.comments.create(comment: Faker::Lorem.sentence(word_count: 3), commenter_id: User.all.first.id)
    post.comments.create(comment: Faker::Lorem.sentence(word_count: 3), commenter_id: User.all.first.id)
end

Comment.all.each do |comment|
    comment.votes.create!(voter_id: User.all.first.id, upvote: true)
    comment.votes.create!(voter_id: User.all.last.id, upvote: false)
end

