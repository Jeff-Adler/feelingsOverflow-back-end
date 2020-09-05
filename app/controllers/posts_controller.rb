class PostsController < ApplicationController
    before_action :find_post, only: [:show, :destroy, :update, :getComments, :createComment]
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token

    def index 
        posts = Post.all
        posts = posts.sort_by{ |post| [post.created_at, post.updated_at].max }.reverse!
        render json: posts.to_json
    end

    def show 
        render json: @post.to_json, include: :comments
    end

    def create 
        post = current_user.posts.create(post_params)
        if post.valid?
            render json: post.to_json, status: :created
        else
            render json: { error: 'failed to create post' }, status: :not_acceptable
        end
    end

    def update
        @post.update(post_params)
        if @post.valid?
            render json: @post.to_json
        else
            render json: { error: 'failed to edit post' }, status: :not_acceptable
        end
    end

    def destroy 
        @post.destroy
        render json: { confirmation: 'deleted!' } 
    end

    def getComments
        render json: @post.comments.to_json
    end

    def my_posts
        user = User.find(params[:id])
        render json: user.posts.to_json
      end

    private

    def post_params
        params.require(:post).permit(:positive, :negative, :severe, :category)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
