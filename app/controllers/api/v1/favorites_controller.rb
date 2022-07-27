class Api::V1::FavoritesController < ApplicationController
  def new; end

  def create
    favorite_create = Favorite.create(favorite_params)
    render json: FavoriteSerializer.new(favorite_create), status: 201
  end

  private
    def favorite_params
      params.require(:favorite).permit(:location, :user_id)
    end
end
