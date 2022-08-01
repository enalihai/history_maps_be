class Api::V1::LocationSearchController < ApplicationController

  def show
    # location = MapquestLocation.search_by_street(search_params[:location]).first
    # if location
      # render json: MapquestLocationFacade.get_mapquest_location_data(location)
      render json: MapquestLocationFacade.get_mapquest_location_data(search_params[:location])
    # else
    #   render json: { data: { message: "No match found" } }, status: 400
    # end
  end

  private
    def search_params
      params.permit(:location)
    end
end
