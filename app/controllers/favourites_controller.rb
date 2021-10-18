class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :update, :destroy]

  # GET /favourites
  def index
    @favourites = Favourite.all

    render json: @favourites
  end

  # POST /favourites
  def create
    @favourite = Favourite.new(favourite_params)

    if @favourite.save
      render json: @favourite, status: :created, location: @favourite
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourites/1
  def destroy
    @favourite.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_params
      params.fetch(:favourite, {})
    end
end
