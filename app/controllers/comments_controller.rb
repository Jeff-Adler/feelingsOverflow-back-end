class CommentsController < ApplicationController
    before_action :find_comment, only: [:destroy, :update]
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token

    def index
        comments = Comment.all
        render json: comments.to_json
    end

    def create 
        comment = current_user.comments.create(comment_params)
        if comment.valid?
            render json: comment.to_json, status: :created
        else
            render json: { error: 'failed to create comment' }, status: :not_acceptable
        end
    end

    def update
        @comment.update(comment_params)
        if @comment.valid?
            render json: @comment.to_json
        else
            render json: { error: 'failed to edit comment' }, status: :not_acceptable
        end
    end

    def destroy
        @comment.destroy
        render json: { confirmation: 'deleted!' } 
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :post_id) 
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
