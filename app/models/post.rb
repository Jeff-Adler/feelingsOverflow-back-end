class Post < ApplicationRecord
  belongs_to :poster, class_name: :User
  has_many :comments, dependent: :destroy
  validates :positive, :negative, :severe, :category, :poster, presence: true
end
