class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token
    before_action :find_user, only: [:update,:retrieve_user_posts,:retrieve_user_analytics,:voted_comments]

    def index
      render json: User.all.to_json
    end

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
 
    def create
        @user = User.create(user_params)
        if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
        render json: @user.errors.full_messages, status: :not_acceptable
        end
    end

  def update
    @user.update_attribute(:birthdate, user_edit_params[:birthdate])
    @user.update_attribute(:gender, user_edit_params[:gender])
    @user.update_attribute(:location, user_edit_params[:location])
    render json: { user: UserSerializer.new(@user)}
  end

  def retrieve_user_posts
    posts = @user.posts
    posts = posts.sort_by{ |post| [post.created_at, post.updated_at].max }.reverse!
    render json: posts.to_json
  end

  def retrieve_user_analytics
    render json: @user.user_analytics.to_json
  end

  def voted_comments
    render json: @user.voted_comments.to_json
  end
     
    private
    
  def user_params
    params.require(:user).permit(:username, :password, :birthdate, :gender, :location)
  end

  def user_edit_params
    params.require(:user).permit(:birthdate, :gender, :location)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
