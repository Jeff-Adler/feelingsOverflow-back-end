class VoteSerializer < ActiveModel::Serializer
  attributes :id, :upvote
  has_one :voter
  has_one :comment
end
