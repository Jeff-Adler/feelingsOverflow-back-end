class PostSerializer < ActiveModel::Serializer
  attributes :id, :positive, :negative, :severe, :category
  has_one :user
end
