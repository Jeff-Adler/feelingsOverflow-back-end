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

user1 = User.create!(username: "Geoffrey", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: Faker::Address.city)
user2 = User.create!(username: "Jeffery", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: Faker::Address.city)
user3 = User.create!(username: "JeffAlder", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: Faker::Address.city)

post1 = Post.create!(mood_rating: "Pretty good", mood_length: "A few weeks", mood_location: "The DOM", 
mood_trigger: "No", mood_trigger_detail: "", 
mood_description: "I spent so much time thinking that I'm just not smart enough, just not resilient enough to be a programmer.
I took a few classes in high school, which I enjoyed, but then I did awful in my first college CS class. Now, 
going back to programming has finally made me believe in myself. Every bug I solve makes me feel stronger than before.", 
mood_purpose: "Give Support", mood_title: "Coding Catharsis", 
mood_category: "Self-confidence", mood_category_detail: "", 
poster_id: user1.id, poster_name: user1.username)

post1.comments.create!(comment: "Amazing man! So easy for one small setback to take us off track. Glad you hopped back on!" , commenter_id: user2.id)
post1.comments.create!(comment: "Major props, brother.", commenter_id: user3.id)

post2 = Post.create!(mood_rating: "Doing okay", mood_length: "A few weeks", mood_location: "In Marching Band Practice",
mood_trigger: "Yes", mood_trigger_detail: "Meeting new people", 
mood_description: "It's almost hard to admit, but the happiest part of every school year is marching band season.
I love my friends, but there's something special about connecting with people who I would NEVER talk to, if we weren't
band-mates.", mood_purpose: "Give Support", mood_title: "Why I March.", 
mood_category: "School", mood_category_detail: "aker::Lorem.sentence(word_count: 3)", 
poster_id: user1.id, poster_name: user1.username)

post2.comments.create!(comment: "Ha, even though I graduated high school 15 years ago, my fondest memories are still from marching band." , commenter_id: user2.id)
post2.comments.create!(comment: "I feel you, dude. That's the only reason I did sports in high school, the camaraderie.", commenter_id: user3.id)

Comment.all.each do |comment|
    comment.votes.create!(voter_id: User.all.first.id, upvote: true)
    comment.votes.create!(voter_id: User.all.last.id, upvote: false)
    comment.votes.create!(voter_id: User.all.first.id, upvote: true)
    comment.votes.create!(voter_id: User.all.last.id, upvote: false)
end

# post3 = Post.create!(mood_rating: "A little down", mood_length: "1-6 months", mood_location: "In my room",
# mood_trigger: "No", mood_trigger_detail: "", 
# mood_description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4), 
# mood_purpose: Faker::Lorem.sentence(word_count: 3), mood_title: Faker::Lorem.sentence(word_count: 1), 
# mood_category: Faker::SlackEmoji.activity, mood_category_detail: Faker::Lorem.sentence(word_count: 3), 
# poster_id: user.id, poster_name: user.username)
