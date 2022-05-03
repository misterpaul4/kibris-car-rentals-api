class AuthenticationController < ApplicationController
	before_action :authorize_request, except: :login

  # POST /login
  def login
    begin
      @user = User.find_by_username!(params[:username])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       username: @user.username, role: @user.role, company_name: @user.company_name }, status: :ok
      else
        render json: { errors: 'incorrect password' }, status: :unauthorized
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: 'incorrect login credentials' }, status: :not_found
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end

end
