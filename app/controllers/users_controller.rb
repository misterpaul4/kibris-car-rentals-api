class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy uploaded_cars favourite_cars favourite_cars_ids cars_favs]
  before_action :authorize_request, except: %i[create index]
  before_action :check_param_token, except: %i[create index]

  def index
    @users = User.all

    render json: @users
  end

  def cars_favs
    @cars = Car.all
    @favourites = @current_user.favourites

    render json: {
      cars: Car.all,
      favourites: @favourites
    }
  end

  def show
    render json: @current_user
  end

  def uploaded_cars
    @cars = @current_user.cars_uploaded

    render json: @cars
  end

# GET users/(:_username)/favourites
  def favourite_cars
    @favourites = @current_user.favourites

    render json: @favourites
  end

  # POST /signup
  def create
    @user = User.new(user_params)
    @user.company_name = '' if @user.role == 'user'

    if @user.save
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       username: @user.username, role: @user.role, id: @user.id,
                       company_name: @user.company_name },
                       status: :created

    else
      render json: {errors: @user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/username
  def update
    # user cannot change role after signing up
    if @current_user.update(username: user_params[:username], password: user_params[:password], company_name: user_params[:company_name])
      render json: @current_user
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/username
  def destroy
    @current_user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:username, :password, :password_confirmation, :role, :company_name)
  end

  def check_param_token
    unless @current_user.eql? @user
      render json: { errors: "invalid token for #{@user.username}" }, status: :unauthorized
    end
  end
end
