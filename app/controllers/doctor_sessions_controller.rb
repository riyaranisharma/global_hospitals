class DoctorSessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(
      email: params[:email],
      role: "doctor"
    )

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to doctor_dashboard_path
    else
      flash.now[:alert] = "Invalid doctor email or password"
      render :new, status: :unprocessable_entity
    end
  end

end