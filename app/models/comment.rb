class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: :User, foreign_key: "user_id" 
  validates :comment, :post, presence: true
end
