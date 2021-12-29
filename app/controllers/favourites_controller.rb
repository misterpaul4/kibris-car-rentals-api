class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[show update destroy]
  before_action :authorize_request
  before_action :check_user, only: %i[destroy]

  # POST /favourites
  def create
    @favourite = @current_user.favourites.build(favourite_params)

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
    params.permit(:car_id)
  end

  def check_user
    unless @current_user.id == @favourite.user_id
      render json: { errors: "unathorized" }, status: :unauthorized 
    end
  end
end
