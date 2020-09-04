class Post < ApplicationRecord
  belongs_to :poster, class_name: :User, foreign_key: "user_id", optional: true
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :poster
  # validates :positive, :negative, :severe, :category, presence: true

end
