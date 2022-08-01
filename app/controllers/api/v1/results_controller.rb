class Api::V1::ResultsController < ApplicationController
  def index
    render json: LocFacade.create_all_results(search_params[:location])
  end

  def show

  end
end
