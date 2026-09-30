class DoctorPasswordsController < ApplicationController

  # Forgot Password Page
  def new
  end


  # Email Check
  def create
    user = User.find_by(
      email: params[:email],
      role: "doctor"
    )

    if user
      # User ID temporarily session me store
      session[:reset_user_id] = user.id

      # Reset Password page open
      redirect_to doctor_reset_password_path
    else
      flash.now[:alert] = "Doctor email not found"
      render :new
    end
  end


  # Reset Password Page
  def edit
    @user = User.find_by(
      id: session[:reset_user_id],
      role: "doctor"
    )

    unless @user
      redirect_to doctor_forgot_password_path,
                  alert: "Please enter your email first."
    end
  end


  # Update Password
  def update
    @user = User.find_by(
      id: session[:reset_user_id],
      role: "doctor"
    )

    unless @user
      redirect_to doctor_forgot_password_path,
                  alert: "Session expired. Please try again."
      return
    end

    if @user.update(
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

      # Session remove
      session.delete(:reset_user_id)

      # Doctor Login page par redirect
      redirect_to doctor_login_path,
                  notice: "Password reset successfully! Please login with your new password."
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

end