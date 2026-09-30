class AppointmentsController < ApplicationController

  def index
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @appointments = Appointment
      .where(patient_id: @patient.id)
      .order(created_at: :desc)

    @total_appointments = @appointments.count

    @upcoming_appointments = @appointments
      .where("appointment_date >= ?", Date.current)
      .count

    @pending_appointments = @appointments
      .where(status: "pending")
      .count

    @cancelled_appointments = @appointments
      .where(status: "cancelled")
      .count
  end


  def new
    @appointment = Appointment.new

    # Doctors ko booking form mein dikhane ke liye
    @doctors = User.where(role: "doctor")
  end


  def create
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @appointment = Appointment.new(appointment_params)

    # Logged-in patient
    @appointment.patient_id = @patient.id

    # Patient ki booking automatically Pending rahegi
    @appointment.status = "pending"

    # Selected doctor
    doctor = User.find_by(id: params[:appointment][:doctor_id])

    if doctor.nil? || doctor.role != "doctor"
      @appointment.errors.add(:doctor_id, "Please select a valid doctor")
      @doctors = User.where(role: "doctor")
      render :new, status: :unprocessable_entity
      return
    end

    @appointment.doctor_id = doctor.id
    @appointment.doctor_name = "#{doctor.first_name} #{doctor.last_name}"

    if @appointment.save
      redirect_to appointments_path,
                  notice: "Appointment booked successfully. Waiting for doctor confirmation."
    else
      @doctors = User.where(role: "doctor")
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @appointment = Appointment.find_by(
      id: params[:id],
      patient_id: @patient.id
    )

    unless @appointment
      redirect_to appointments_path,
                  alert: "Appointment not found."
      return
    end
  end


  def edit
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @appointment = Appointment.find_by(
      id: params[:id],
      patient_id: @patient.id
    )

    unless @appointment
      redirect_to appointments_path,
                  alert: "Appointment not found."
      return
    end

    @doctors = User.where(role: "doctor")
  end


  def update
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @appointment = Appointment.find_by(
      id: params[:id],
      patient_id: @patient.id
    )

    unless @appointment
      redirect_to appointments_path,
                  alert: "Appointment not found."
      return
    end

    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment),
                  notice: "Appointment updated successfully."
    else
      @doctors = User.where(role: "doctor")
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def appointment_params
    params.require(:appointment).permit(
      :doctor_id,
      :department,
      :appointment_date,
      :appointment_time
    )
  end

end