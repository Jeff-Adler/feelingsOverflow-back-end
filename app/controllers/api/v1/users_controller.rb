class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
 
    def create
        @user = User.create(user_params)
        if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
        render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end


  def update
    @user.update(user_edit_params)
    if @user.valid?
        render json: @user.to_json
    else
        render json: { error: 'failed to edit user' }, status: :not_acceptable
    end
  end

  def retrieve_user_analytics
    user = User.find(params[:id])
    render json: user.user_analytics.to_json
  end
     
    private
    
  def user_params
    params.require(:user).permit(:username, :password, :birthdate, :gender, :location)
  end

  def user_edit_params
    params.require(:user).permit(:birthdate, :gender, :location)
  end

end
