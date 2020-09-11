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


user1  = User.create!(username: "betty12345", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 25, max_age: 35), gender: "Female", location: "New York, NY")
user2  = User.create!(username: "Alan54321", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 30, max_age: 40), gender: "Male", location: "Brooklyn, NY")

post1  = Post.create!(mood_rating: "Pretty good", mood_length: "A few days", mood_location: "At work", 
mood_trigger: "Yes", mood_trigger_detail: "Got a raise", mood_description: "I made the case for higher pay  months ago and a raise finally came through", mood_purpose: "Give Support", mood_title: "Finally got a raise!", mood_category: "Work", mood_category_detail: "", poster_id: user1.id, poster_name: user1.username)

post2  = Post.create!(mood_rating: "Could be better", mood_length: "A few weeks", mood_location: "Watching the news", 
mood_trigger: "Yes", mood_trigger_detail: "Talking to family", mood_description: "My uncle keeps calling me because watches Fox News and thinks New York is a war zone", mood_purpose: "Get Support", mood_title: "Worried about election", mood_category: "Other", mood_category_detail: "Politics", poster_id: user2.id, poster_name: user2.username)

comment1 = Comment.create(comment: "Great! Congratulations!", post: post1, commenter_id: user2.id)

comment2 = Comment.create(comment: "Wow, that must be difficult", post: post2, commenter_id: user1.id)

# post1.comments.create(comment: Faker::Lorem.sentence(word_count: 3), commenter_id: User.all.first.id)

comment1.votes.create!(voter_id: User.all.first.id, upvote: true)
comment2.votes.create!(voter_id: User.all.first.id, upvote: true)



# for i in 0...20 do
#     gender = (i % 2 == 0) ? "male" : "female"
#     user = User.create!(username: Faker::Name.unique.name, password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: gender, location: Faker::Address.city)
#     severe = (i % 2 == 0) ? true : false
    
#     post = Post.create!(mood_rating: Faker::Lorem.sentence(word_count: 3), mood_length: Faker::Lorem.sentence(word_count: 3), mood_location: Faker::Lorem.sentence(word_count: 3), 
#     mood_trigger: Faker::Lorem.sentence(word_count: 3), mood_trigger_detail: Faker::Lorem.sentence(word_count: 3), mood_description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4), mood_purpose: Faker::Lorem.sentence(word_count: 3), mood_title: Faker::Lorem.sentence(word_count: 1), mood_category: Faker::SlackEmoji.activity, mood_category_detail: Faker::Lorem.sentence(word_count: 3), poster_id: user.id, poster_name: user.username)
    
#     Comment.create(comment: Faker::Lorem.sentence(word_count: 3), post: post, commenter_id: user.id)
#     Comment.create(comment: Faker::Lorem.sentence(word_count: 3), post: post, commenter_id: user.id)
# end

# Post.all.each do |post|
#     post.comments.create(comment: Faker::Lorem.sentence(word_count: 3), commenter_id: User.all.first.id)
#     post.comments.create(comment: Faker::Lorem.sentence(word_count: 3), commenter_id: User.all.first.id)
# end

# Comment.all.each do |comment|
#     comment.votes.create!(voter_id: User.all.first.id, upvote: true)
#     comment.votes.create!(voter_id: User.all.last.id, upvote: false)
# end

