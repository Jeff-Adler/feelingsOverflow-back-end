class Comment < ApplicationRecord
  belongs_to :post
  validates :comment, :post, presence: true
end
