class Post < ApplicationRecord
  belongs_to :user
  validates :positive, :negative, :severe, :category, :user, presence: true
end
