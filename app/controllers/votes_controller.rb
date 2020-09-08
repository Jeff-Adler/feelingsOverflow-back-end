class VotesController < ApplicationController
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token
    
    def create 
        vote = current_user.votes.create(vote_params)
        if vote.valid?
            render json: vote.to_json, status: :created
        else
            render json: { error: 'failed to create vote' }, status: :not_acceptable
        end
    end

    private

    def vote_params
        params.require(:vote).permit(:comment_id,:upvote)
    end

end
