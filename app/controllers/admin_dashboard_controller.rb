class AdminDashboardController < ApplicationController
  before_action :require_admin

  def index
    @total_doctors = User.where(role: "doctor").count
    @total_patients = User.where(role: "patient").count
    @total_appointments = Appointment.count
    @total_medical_records = MedicalReport.count

    @total_lab_reports =
      if defined?(LabReport)
        LabReport.count
      else
        0
      end

    @total_billing =
      if defined?(Bill)
        Bill.count
      else
        0
      end

    @recent_doctors = User
      .where(role: "doctor")
      .order(created_at: :desc)
      .limit(5)

    @recent_patients = User
      .where(role: "patient")
      .order(created_at: :desc)
      .limit(5)
  end

  private

  def require_admin
    unless session[:user_id]
      redirect_to admin_login_path, alert: "Please login first."
      return
    end

    user = User.find_by(id: session[:user_id])

    unless user&.role == "admin"
      redirect_to admin_login_path, alert: "Access denied."
    end
  end
end
