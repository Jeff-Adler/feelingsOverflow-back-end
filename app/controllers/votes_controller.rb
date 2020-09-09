class VotesController < ApplicationController
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token
    
    def create 
        comment = Comment.find(params[:id])
        vote = comment.votes.build(vote_params)
        user = current_user
        vote.voter_id = user.id
        vote.save
        if vote.valid?
            comment.tally_votes
            render json: comment.to_json, status: :created
        else
            render json: { error: 'failed to create vote' }, status: :not_acceptable
        end
    end

    def my_votes
        render json: current_user.votes.to_json
    end

    private

    def vote_params
        params.require(:vote).permit(:upvote)
    end

end
