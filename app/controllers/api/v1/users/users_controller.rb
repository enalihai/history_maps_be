class Api::V1::Users::UsersController < ApplicationController

  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    user = User.find_by_id(params[:id])
    if user
      render json: UserSerializer.new(user)
    else
      render json: { status: "User Not Found", code: 404, message: "User Not Found" }, status: 404
    end
  end

  def new; end

  def create
    user_create = User.create(email: user_params[:email], username: user_params[:username])
    render json: UserSerializer.new(user_create), status: 201
  end

  private
    def user_params
      params.permit(:email, :username)
    end
end
