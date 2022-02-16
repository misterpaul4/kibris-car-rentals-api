class WaitingListsController < ApplicationController
  before_action :set_waiting_list, only: [:destroy]
  before_action :authorize_request, except: %i[index]
  before_action :check_user_role, only: %i[create]
  before_action :check_admin_role, only: %i[destroy]

  # GET /waiting_lists
  def index
    @waiting_lists = WaitingList.all

    render json: @waiting_lists
  end

  # POST /waiting_lists
  def create
    begin
    @waiting_list = @current_user.waiting_lists.build(waiting_list_params)

    if @waiting_list.save
      render json: @waiting_list, status: :created, location: @waiting_list
    else
      render json: @waiting_list.errors, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotUnique => e
      render json: { errors: 'user already on the waiting list' }, status: :forbidden
    end
  end

  # DELETE /waiting_lists/
  def destroy
    @waiting_list.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_waiting_list
    @waiting_list = WaitingList.find(params[:id])
  end

  def check_user_role
    unless @current_user.role == 'user'
      render json: { errors: "unathorized, an admin cannot be on the waiting list" }, status: :unauthorized 
    end
  end

  def check_admin_role
    begin
    @car = Car.find(params[:car_id])
    unless @current_user == @car.uploader
      render json: { errors: "unathorized, only an authorized admin can remove a user from the waiting list" }, status: :unauthorized
    end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: 'car_id is required' }, status: :not_found
    end
  end

  # Only allow a list of trusted parameters through.
  def waiting_list_params
    params.permit(:car_id)
  end
end
