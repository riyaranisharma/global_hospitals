class DoctorAppointmentsController < ApplicationController

  def index
    @doctor = User.find_by(id: session[:user_id])

    unless @doctor && @doctor.role == "doctor"
      redirect_to doctor_login_path,
                  alert: "Please login as doctor."
      return
    end

    @appointments = Appointment
      .where(doctor_id: @doctor.id)
      .order(appointment_date: :asc)

    @pending_appointments = @appointments.where(status: "pending")
    @confirmed_appointments = @appointments.where(status: "confirmed")
    @completed_appointments = @appointments.where(status: "completed")
    @cancelled_appointments = @appointments.where(status: "cancelled")
  end


  def confirm
    @doctor = User.find_by(id: session[:user_id])

    @appointment = Appointment.find_by(
      id: params[:id],
      doctor_id: @doctor.id
    )

    unless @appointment
      redirect_to doctor_appointments_path,
                  alert: "Appointment not found."
      return
    end

    @appointment.update(status: "confirmed")

    redirect_to doctor_appointments_path,
                notice: "Appointment confirmed successfully."
  end


  def reject
    @doctor = User.find_by(id: session[:user_id])

    @appointment = Appointment.find_by(
      id: params[:id],
      doctor_id: @doctor.id
    )

    unless @appointment
      redirect_to doctor_appointments_path,
                  alert: "Appointment not found."
      return
    end

    @appointment.update(status: "cancelled")

    redirect_to doctor_appointments_path,
                notice: "Appointment rejected."
  end

end