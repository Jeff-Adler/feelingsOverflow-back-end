class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating
  has_one :post
  has_one :user
end
