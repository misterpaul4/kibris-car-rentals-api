class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]
  before_action :authorize_request, except: %i[index show]
  before_action :check_role, only: %i[create destroy update]
  before_action :check_uploader, only: %i[destroy update]

  # GET /cars
  def index
    @cars = Car.all

    # render json: @cars, only: [:delivery]
    render json: @cars
  end

  # GET /cars/1
  def show
    render json: @car
  end

  # POST /cars
  def create
    @car = @current_user.cars_uploaded.build(car_params)

    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.permit(
      :delivery,
      :three_day_rental_price,
      :one_week_rental_price,
      :one_month_rental_price,
      :fuel_type,
      :rental_requirements,
      :terms_and_conditions,
      :rental_company,
      :status,
      :manufacturer,
      :model,
      :image_url,
    )
  end

  def check_role
    unless @current_user.role == 'admin'
      render json: { errors: "unathorized, you must be an admin" }, status: :unauthorized 
    end
  end

  def check_uploader
    unless @current_user.id == @car.uploader_id
      render json: { errors: "unathorized, car belongs to a different admin" }, status: :unauthorized 
    end
  end
end
