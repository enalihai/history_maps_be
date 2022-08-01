class Api::V1::ResultsController < ApplicationController
  def index
    render json: LocResultFacade.create_loc_index_results(search_params[:location])
  end

  def show

  end

  private
    def search_params
      params.permit(:location)
    end
end
