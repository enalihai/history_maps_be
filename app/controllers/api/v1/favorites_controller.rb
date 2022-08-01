class Api::V1::FavoritesController < ApplicationController
  def index
    render json: FavoriteSerializer.new(Favorite.all)
  end

  def show
    favorite = Favorite.find_by_id(params[:id])
    if favorite
      render json: FavoriteSerializer.new(favorite)
    else
      render json: { status: "Favorite Not Found", code: 404, message: "Favorite Not Found" }, status: 404
    end
  end

  def new; end

  def create
    favorite_create = Favorite.create(favorite_params)
    render json: FavoriteSerializer.new(favorite_create), status: 201
  end

  private
    def favorite_params
      params.permit(:location_id, :user_id, :title, :other_titles, :pdf, :details, :photo)
    end
end
