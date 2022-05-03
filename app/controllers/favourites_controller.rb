class FavouritesController < ApplicationController
  before_action :authorize_request, except: %i[index]

  def index
    @favourite = Favourite.all

    render json: @favourite
  end

  # POST /favourites
  def create
    begin
      @favourite = @current_user.favourites.build(favourite_params)

      if @favourite.save
        render json: @favourite, status: :created
      else
        render json: @favourite, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique => e
      render json: { errors: 'record already exist' }, status: :forbidden
    end
  end

  # DELETE /favourites
  def destroy
    @favourite = @current_user.favourites.where(car_id: favourite_params[:car_id])[0]
    @favourite.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def favourite_params
    params.permit(:car_id)
  end
end
