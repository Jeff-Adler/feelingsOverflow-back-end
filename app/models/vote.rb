class Vote < ApplicationRecord
  belongs_to :voter, class_name: :User, foreign_key: "user_id", optional: true
  belongs_to :comment
  validates :upvote, uniqueness: true
end
