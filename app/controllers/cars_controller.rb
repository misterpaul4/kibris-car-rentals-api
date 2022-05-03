class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy check_waiting_list get_waiting_list car_fav favourited?]
  before_action :authorize_request, except: %i[index show]
  before_action :check_role, only: %i[create destroy update]
  before_action :check_uploader, only: %i[destroy update get_waiting_list]

  # GET /cars
  def index
    @cars = Car.all
    
    render json: @cars
  end

  # GET /cars/1
  def show
    render json: @car
  end

  # GET /cars/1/fav
  def car_fav
    @favourite = @current_user.favourites.where(car_id: @car.id)

    render json: {
      car: @car,
      waiting_list: @car.waiting_lists.where(applicant_id: @current_user.id).present?,
      favourited: @favourite.present?
    }
  end

  def check_waiting_list
    waitingList = @car.in_waiting_list?(@current_user)

    render json: waitingList.present?
  end

  # GET /cars/1/waiting_list
  def get_waiting_list
    waitingList = @car.waiting_lists

    render json: waitingList
  end

  def favourited?
    @favourite = @current_user.favourites.where(car_id: @car.id)

    render json: @favourite.present?
  end

  # POST /cars
  def create
    @car = @current_user.cars_uploaded.build(car_params)
    @car.rental_company = @current_user.company_name

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
      :availability,
      :manufacturer,
      :model,
      :image_url,
      :currency,
      :car_vin,
      :model_year,
      :daily_rental_price
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
