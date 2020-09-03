class User < ApplicationRecord
    has_many :posts, class_name: :Post, foreign_key: "poster_id", dependent: :destroy
    has_many :comments, class_name: :Comment, foreign_key: "commenter_id", dependent: :destroy
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
