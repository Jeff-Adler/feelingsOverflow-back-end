class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: :User, foreign_key: "user_id", optional: true
  has_many :votes, dependent: :destroy
  validates :comment, :post, presence: true

  def tally_votes
    votes = self.votes
    upvotes = votes.select do |vote|
      vote.upvote == true
    end
    downvotes = votes.select do |vote|
      vote.upvote == false
    end
    self.update(vote_tally: upvotes.length - downvotes.length)
  end

end
