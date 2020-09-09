class User < ApplicationRecord
    # This returns all posts a user has written
    has_many :posts, class_name: :Post, foreign_key: "poster_id", dependent: :destroy
    # This returns all comments a user has written on any post (theirs or someone else's)
    has_many :comments, class_name: :Comment, foreign_key: "commenter_id", dependent: :destroy
    # This returns all votes a user has given to any comments
    has_many :votes, class_name: :Vote, foreign_key: "voter_id", dependent: :destroy
    # This returns all comments a user has voted on (but not that they have written)
    has_many :voted_comments, through: :votes, source: :comment
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end

