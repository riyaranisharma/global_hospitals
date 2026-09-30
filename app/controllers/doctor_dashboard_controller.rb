class DoctorDashboardController < ApplicationController
  before_action :require_doctor

  def index
    @doctor = current_user

    @today_appointments = Appointment
      .where(
        doctor_id: @doctor.id,
        appointment_date: Date.current
      )
      .order(:appointment_time)

    @today_appointments_count = @today_appointments.count

    @total_patients = User.where(role: "patient").count

    # Prescription model abhi nahi bana hai
    @prescriptions_today = 0
  end

  private

  def require_doctor
    unless current_user && current_user.role == "doctor"
      redirect_to login_path, alert: "Please login as doctor."
    end
  end
end