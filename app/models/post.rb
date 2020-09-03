class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :positive, :negative, :severe, :category, :user, presence: true
end
