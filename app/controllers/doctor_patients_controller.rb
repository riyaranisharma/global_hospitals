class DoctorPatientsController < ApplicationController

  def index
    @doctor = User.find_by(id: session[:user_id])

    unless @doctor && @doctor.role == "doctor"
      redirect_to doctor_login_path,
                  alert: "Please login as doctor."
      return
    end

    # ==========================================
    # DOCTOR APPOINTMENTS
    # ==========================================

    @doctor_appointments = Appointment
      .where(doctor_id: @doctor.id)


    # ==========================================
    # MY PATIENTS
    # ==========================================

    patient_ids = @doctor_appointments
      .where.not(patient_id: nil)
      .distinct
      .pluck(:patient_id)

    @patients = User.where(id: patient_ids)


    # ==========================================
    # SEARCH PATIENTS
    # ==========================================

    if params[:search].present?

      search = "%#{params[:search]}%"

      @patients = @patients.where(
        "first_name ILIKE :search
         OR last_name ILIKE :search
         OR email ILIKE :search
         OR phone ILIKE :search",
        search: search
      )

    end

    @patients = @patients.order(first_name: :asc)


    # ==========================================
    # SELECTED PATIENT
    # ==========================================

    if params[:patient_id].present?
      @selected_patient = @patients.find_by(id: params[:patient_id])
    end

    @selected_patient ||= @patients.first


    # ==========================================
    # SELECTED PATIENT APPOINTMENTS
    # ==========================================

    if @selected_patient.present?

      @patient_appointments = @doctor_appointments
        .where(patient_id: @selected_patient.id)
        .order(appointment_date: :desc)

    else

      @patient_appointments = Appointment.none

    end


    # ==========================================
    # TODAY'S APPOINTMENTS
    # ==========================================

    @todays_appointments = @doctor_appointments
      .where(appointment_date: Date.current)


    # ==========================================
    # NEW PATIENTS THIS MONTH
    # ==========================================

    @new_patients_this_month = @patients
      .where(
        created_at: Time.current.beginning_of_month..
                    Time.current.end_of_month
      )
      .count


    # ==========================================
    # TOTAL CONSULTATIONS
    # ==========================================

    @total_consultations = @doctor_appointments
      .where(status: ["completed", "confirmed"])
      .count


    # ==========================================
    # LAST VISIT
    # ==========================================

    if @selected_patient.present?

      @last_visit = @patient_appointments
        .where(status: ["completed", "confirmed"])
        .maximum(:appointment_date)

    else

      @last_visit = nil

    end


    # ==========================================
    # PATIENT LAST VISITS
    # ==========================================

    @patient_last_visits = {}

    @patients.each do |patient|

      @patient_last_visits[patient.id] =
        @doctor_appointments
          .where(patient_id: patient.id)
          .maximum(:appointment_date)

    end

  end

end