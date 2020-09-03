class PostsController < ApplicationController
    before_action :find_post, only: [:show, :destroy, :update]


    def index 
        posts = Post.all
        render json: posts
    end

    def show 
        render json: @post, include: :comments
    end

    def create 
        post = Post.create(post_params)
        if post.valid?
            render json: post, status: :created
        else
            render json: { error: 'failed to create post' }, status: :not_acceptable
        end
    end

    def update
        @post.update(post_params)
        if post.valid?
            render json: post
        else
            render json: { error: 'failed to edit post' }, status: :not_acceptable
        end
    end

    def destroy 
        @post.destroy
        render json: { confirmation: 'deleted!' } 
    end

    private

    def post_params
        params.require(:post).permit(:postive, :negative, :severe, :category, :poster)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
