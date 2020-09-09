class Post < ApplicationRecord
  belongs_to :poster, class_name: :User, foreign_key: "user_id", optional: true
  has_many :comments, dependent: :destroy
  # This can likely be removed
  accepts_nested_attributes_for :poster
end
