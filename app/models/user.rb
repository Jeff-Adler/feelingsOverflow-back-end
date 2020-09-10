class User < ApplicationRecord
    # This returns all posts a user has written
    has_many :posts, class_name: :Post, foreign_key: "poster_id", dependent: :destroy
    # This returns all comments a user has written on any post (theirs or someone else's)
    has_many :comments, class_name: :Comment, foreign_key: "commenter_id", dependent: :destroy
    # This returns all votes a user has given to any comments
    has_many :votes, class_name: :Vote, foreign_key: "voter_id", dependent: :destroy
    # This returns all comments a user has voted on (but not that they have written)
    has_many :voted_comments, through: :votes, source: :comment
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, :password, length: { in: 6..20 }

    def total_upvotes
        upvotes = self.votes.select do |vote|
            vote.upvote == true
        end
        upvotes.length
    end

    def total_downvotes
        downvotes = self.votes.select do |vote|
            vote.upvote == false
        end
        downvotes.length
    end

    def most_popular_comment
        most_popular_comment = self.comments.max_by do |comment|
            comment.tally_votes
        end
        most_popular_comment
    end

    def most_commented_post
        most_commented_post = self.posts.max_by do |post|
            post.comments.length
        end
        most_commented_post
    end

    def user_analytics
        analytics = [
            {:signup_date => self.created_at},
            {:total_comments => self.comments.length},
            {:total_upvotes => self.total_upvotes},
            {:total_downvotes => self.total_downvotes},
            {:most_popular_comment => self.most_popular_comment},
            {:most_commented_post => self.most_commented_post}
    ]
    end
end

