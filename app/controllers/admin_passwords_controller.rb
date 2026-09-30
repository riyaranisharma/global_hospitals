class AdminPasswordsController < ApplicationController

  # Forgot Password Page
  def new
  end

  # Admin Email Check
  def create
    user = User.find_by(
      email: params[:email],
      role: "admin"
    )

    if user
      session[:reset_admin_id] = user.id

      redirect_to admin_reset_password_path
    else
      flash.now[:alert] = "Admin email not found"
      render :new
    end
  end


  # Reset Password Page
  def edit
    @user = User.find_by(
      id: session[:reset_admin_id],
      role: "admin"
    )

    unless @user
      redirect_to admin_forgot_password_path,
                  alert: "Please enter your email first."
    end
  end


  # Update Password
  def update
    @user = User.find_by(
      id: session[:reset_admin_id],
      role: "admin"
    )

    unless @user
      redirect_to admin_forgot_password_path,
                  alert: "Session expired. Please try again."
      return
    end

    if @user.update(
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

      session.delete(:reset_admin_id)

      redirect_to admin_login_path,
                  notice: "Password reset successfully! Please login with your new password."
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

end