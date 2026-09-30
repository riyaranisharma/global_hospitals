class DashboardsController < ApplicationController

  def patient
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @upcoming_appointments = Appointment
      .where(patient_id: @patient.id)
      .where("appointment_date >= ?", Date.current)
      .order(appointment_date: :asc)
      .limit(3)

    @medical_reports = MedicalReport
      .where(patient_id: @patient.id)
      .order(report_date: :desc)
      .limit(5)

    @medical_report_count = MedicalReport
      .where(patient_id: @patient.id)
      .count

    @appointment_count = Appointment
      .where(patient_id: @patient.id)
      .where("appointment_date >= ?", Date.current)
      .count
  end

end