class CommentsController < ApplicationController
    before_action :find_comment, only: [:destroy, :update]
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token

    def index
        comments = Comment.all
        render json: comments.to_json
    end

    def create 
        comment = Comment.create(comment_params)
        if comment.valid?
            render json: comment, status: :created
        else
            render json: { error: 'failed to create comment' }, status: :not_acceptable
        end
    end

    def update
        @comment.update(post_params)
        if post.valid?
            render json: post
        else
            render json: { error: 'failed to edit post' }, status: :not_acceptable
        end
    end

    def destroy
        @comment.destroy
        render json: { confirmation: 'deleted!' } 
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :rating, :post, :commenter) #may need to swap :user with :user_id
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
