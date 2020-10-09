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

#Seed Users
for i in 1..5 do 
    User.create!(
        username: Faker::Internet.unique.username(specifier: 7..19), 
        password: Faker::Alphanumeric.alpha(number: 10), 
        birthdate: Faker::Date.birthday(min_age: 22, max_age: 50), 
        gender: Faker::Gender.binary_type, 
        location: Faker::Address.city
    )
end

#Seed Posts and Comments
post1 = Post.create!(
    mood_rating: MOOD_RATING[0], 
    mood_length: MOOD_LENGTH[0], 
    mood_location: MOOD_LOCATION[2], 
    mood_trigger: "Yes" ,
    mood_trigger_detail: "Finally got rewarded for my hard work.", 
    mood_description: "I made the case for higher pay months ago and a raise finally came through!", 
    mood_purpose: "Give Support", 
    mood_title: "Got a raise!", 
    mood_category: MOOD_CATEGORY[1], 
    mood_category_detail: "", 
    poster_id: User.all[0].id, 
    poster_name: User.all[0].username
)

post1.comments.create!(comment: "Heck yes, brother!", commenter_id: User.all[1])
post1.comments.create!(comment: "GET IT.", commenter_id: User.all[4])
post1.comments.create!(comment: "YAAASSSSS", commenter_id: User.all[3])

post2 = Post.create!(
    mood_rating: MOOD_RATING[3], 
    mood_length: MOOD_LENGTH[4], 
    mood_location: MOOD_LOCATION[3], 
    mood_trigger: "Yes" ,
    mood_trigger_detail: "Skipping sports practice to play games with friends.", 
    mood_description: "My parents don't understand my love of video games", 
    mood_purpose: "Get Support", 
    mood_title: "My parents don't understand me.", 
    mood_category: MOOD_CATEGORY[0], 
    mood_category_detail: "", 
    poster_id: User.all[1].id, 
    poster_name: User.all[1].username, 
)

post2.comments.create!(comment: "Ugh, I know what you mean! Even when I really try to explain, they just laugh me off.", commenter_id: User.all[3])
post2.comments.create!(comment: "Some people are just set in their ways. But eventually you will be able to leave home, and you'll never have to worry about it again.", commenter_id: User.all[4])

post3 = Post.create!(
    mood_rating: "A little down", 
    mood_length: "1-6 months", 
    mood_location: "At home", 
    mood_trigger: "No" ,
    mood_trigger_detail: "", 
    mood_description: "I worry that I might never be able to experience normal life before quarantine.", 
    mood_purpose: "Get Support", 
    mood_title: "Life in quarantine.", 
    mood_category: "Other", 
    mood_category_detail: "Loneliness", 
    poster_id: User.all[2].id, 
    poster_name: User.all[2].username, 
)

post3.comments.create!(comment: "I know what you mean man. I miss all my favorite late-night spots, and just meeting new people", commenter_id: User.all[3])
post3.comments.create!(comment: "I feel you, but don't forget that even this will pass.", commenter_id: User.all[4])

post4 = Post.create!(
    mood_rating: "Pretty good", 
    mood_length: "A few weeks", 
    mood_location: "The DOM", 
    mood_trigger: "No", 
    mood_trigger_detail: "", 
    mood_description: "I spent so much time thinking that I'm just not smart enough, just not resilient enough to be a programmer.
I took a few classes in high school, which I enjoyed, but then I did awful in my first college CS class. Now, 
going back to programming has finally made me believe in myself. Every bug I solve makes me feel stronger than before.", 
    mood_purpose: "Give Support", 
    mood_title: "Coding Catharsis", 
    mood_category: "Self-confidence", 
    mood_category_detail: "", 
    poster_id: User.all[3].id, 
    poster_name: User.all[3].username
)

post4.comments.create!(comment: "Amazing man! So easy for one small setback to take us off track. Glad you hopped back on!" , commenter_id: User.all[0])
post4.comments.create!(comment: "Major props, brother.", commenter_id: User.all[1])

post5 = Post.create!(
    mood_rating: "Doing okay", 
    mood_length: "A few weeks", 
    mood_location: "In Marching Band Practice",
    mood_trigger: "Yes", 
    mood_trigger_detail: "Meeting new people", 
    mood_description: "It's almost hard to admit, but the happiest part of every school year is marching band season.
I love my friends, but there's something special about connecting with people who I would NEVER talk to, if we weren't
band-mates.", 
    mood_purpose: "Give Support", 
    mood_title: "Why I March.", 
    mood_category: "School", 
    mood_category_detail: "", 
    poster_id: User.all[4].id, 
    poster_name: User.all[4].username
)

post5.comments.create!(comment: "Ha, even though I graduated high school 15 years ago, my fondest memories are still from marching band." , commenter_id: User.all[rand(0..User.all.length - 2)])
post5.comments.create!(comment: "I feel you, dude. That's the only reason I did sports in high school, the camaraderie.", commenter_id: User.all[rand(0..User.all.length - 2)])

#Seed Votes
Comment.all.each do |comment|
    comment.votes.create!(voter_id: User.all[rand(0..User.all.length - 1)].id, upvote: true)
    comment.votes.create!(voter_id: User.all[rand(0..User.all.length - 1)].id, upvote: false)
    comment.votes.create!(voter_id: User.all[rand(0..User.all.length - 1)].id, upvote: true)
end
