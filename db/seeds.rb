require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Vote.destroy_all

MOOD_RATING = [
    "Awesome!",
    "Pretty good",
    "Doing okay",
    "A little down",
    "Could be better",
    "Having a hard time"
]

MOOD_LENGTH = [
    "Just today",
    "A few days",
    "A few weeks",
    "1-6 months",
    "6-12 months",
    "Over a year"
]

MOOD_LOCATION = [
    "At home",
    "At school",
    "At work",
    "Traveling",
    "With my friends",
    "With my family",
    "With my loved one"
]

MOOD_CATEGORY = [
    "Family",
    "Work",
    "School",
    "Friends",
    "Relationships",
    "Self-confidence",
    "Other"
]

for i in 1..5 do 
    User.create!(
        username: Faker::Internet.unique.username(specifier: 7..19), 
        password: Faker::Alphanumeric.alpha(number: 10), 
        birthdate: Faker::Date.birthday(min_age: 22, max_age: 50), 
        gender: Faker::Gender.binary_type, 
        location: Faker::Address.city
    )
end

Post.create!(
    mood_rating: MOOD_RATING[0], 
    mood_length: MOOD_LENGTH[0], 
    mood_location: MOOD_LOCATION[2], 
    mood_trigger: "Yes" ,
    mood_trigger_detail: "Finally got rewarded for my hard work.", 
    mood_description: "I made the case for higher pay months ago and a raise finally came through!", 
    mood_purpose: "Give Support", 
    mood_title: "Got a raise!", 
    mood_category: MOOD_LENGTH[0], 
    mood_category_detail: "", 
    poster_id: user.id, 
    poster_name: user.username
)

# for User.all.each do |user|
#     Post.create!(
#         mood_rating: MOOD_RATING[rand(0..MOOD_RATING-1)], 
#         mood_length: MOOD_LENGTH[rand(0..MOOD_LENGTH-1)], 
#         mood_location: MOOD_LOCATION[rand(0..MOOD_LOCATION-1)], 
#         mood_trigger: "No" ,
#         mood_trigger_detail: "", 
#         mood_description: "I made the case for higher pay months ago and a raise finally came through", 
#         mood_purpose: "Give Support",  #binary
#         mood_title: "Got a raise!", 
#         mood_category: MOOD_LENGTH[rand(0..MOOD_LENGTH-2)], 
#         mood_category_detail: "", 
#         poster_id: user.id, 
#         poster_name: user.username
#     )
# end




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

user1 = User.create!(username: "Geoffrey", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: Faker::Address.city)
user2 = User.create!(username: "Jeffery", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: Faker::Address.city)
user3 = User.create!(username: "JeffAlder", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: Faker::Address.city)
user4 = User.create!(username: "Tsunade", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Female", location: "Hidden Leaf Village")
user5 = User.create!(username: "Orochimaru", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: "Hidden Leaf Village")
user5 = User.create!(username: "Jiraiya", password: Faker::Alphanumeric.alpha(number: 10), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: "Male", location: "Hidden Leaf Village")


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

post3 = Post.create!(mood_rating: "A little down", mood_length: "1-6 months", mood_location: "In my room",
mood_trigger: "No", mood_trigger_detail: "", 
mood_description: "My parents don't understand my love of slugs.", 
mood_purpose: "Get Support", mood_title: "Any slug lovers out there?", 
mood_category: "Family", mood_category_detail: "", 
poster_id: user4.id, poster_name: user4.username)

post3.comments.create!(comment: "Slugs are nothing compared to snakes!" , commenter_id: user4.id)
post3.comments.create!(comment: "But frogs are what really reign supreme.", commenter_id: user5.id)

post4 = Post.create!(mood_rating: "Could be better", mood_length: "Just today", mood_location: "In quarantine",
mood_trigger: "No", mood_trigger_detail: "", 
mood_description: "I'm going to miss all my best coding buds!", 
mood_purpose: "Get Support", mood_title: "Bye Bye 062220!", 
mood_category: "School", mood_category_detail: "", 
poster_id: user2.id, poster_name: user2.username)

post3.comments.create!(comment: "062220 is best cohort ever!" , commenter_id: user3.id)
post3.comments.create!(comment: "I never really liked that Jeff guy much.", commenter_id: user2.id)

post5 = Post.create!(mood_rating: "Awesome!", mood_length: "Just today", mood_location: "In Konoha",
mood_trigger: "Yes", mood_trigger_detail: "Seeing my pupil succeed!", 
mood_description: "So f-ing proud of my pupil Uzumaki Naruto for successfully executing the legendary Rasengan technique!", 
mood_purpose: "Give Support", mood_title: "Nothing like the feeling of teaching others.", 
mood_category: "Relationships", mood_category_detail: "", 
poster_id: user5.id, poster_name: user5.username)

Comment.all.each do |comment|
    comment.votes.create!(voter_id: User.all.first.id, upvote: true)
    comment.votes.create!(voter_id: User.all.last.id, upvote: false)
    comment.votes.create!(voter_id: User.all.first.id, upvote: true)
    comment.votes.create!(voter_id: User.all.last.id, upvote: false)
end

