class PatientProfilesController < ApplicationController

  def index
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
    end
  end

  def edit
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
    end
  end

  def update
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    if @patient.update(patient_params)
      redirect_to patient_profile_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :gender,
      :date_of_birth,
      :blood_group,
      :address,
      :city,
      :state,
      :pin_code,
      :alternate_phone,
      :emergency_contact_name,
      :emergency_relationship,
      :emergency_phone,
      :marital_status,
      :nationality,
      :preferred_language,
      :allergies,
      :chronic_conditions,
      :current_medications,
      :smoking_status,
      :alcohol_consumption
    )
  end

end