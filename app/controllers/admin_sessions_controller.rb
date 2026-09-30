class AdminSessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email], role: "admin")

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_dashboard_path
    else
      flash.now[:alert] = "Invalid admin email or password"
      render :new
    end
  end

end