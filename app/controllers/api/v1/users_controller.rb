class Api::V1::UsersController < ApplicationController

  def new; end

  def create
    user_create = User.create(user_params)
    render json: UserSerializer.new(user_create), status: 201
  end

  private
    def user_params
      params.require(:user).permit(:email, :username)
    end
end
