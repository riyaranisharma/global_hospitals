class DoctorPrescriptionsController < ApplicationController
  before_action :authenticate_doctor
  before_action :set_prescription, only: [:show]

  def index
    @prescriptions = Prescription
      .where(doctor_id: @doctor.id)
      .includes(:patient, :prescription_medicines)
      .order(created_at: :desc)
  end

  def new
    @prescription = Prescription.new

    10.times do
      @prescription.prescription_medicines.build
    end

    load_appointments
  end

  def create
    appointment = Appointment
      .where(doctor_id: @doctor.id)
      .where(status: ["confirmed", "completed"])
      .find_by(id: params[:prescription][:appointment_id])

    unless appointment
      @prescription = Prescription.new(prescription_params)
      load_appointments

      @prescription.errors.add(
        :appointment,
        "must be selected"
      )

      render :new, status: :unprocessable_entity
      return
    end

    @prescription = Prescription.new(prescription_params)

    # Remove completely blank medicine rows
    @prescription.prescription_medicines =
      @prescription.prescription_medicines.select do |medicine|
        medicine.medicine_name.present?
      end

    @prescription.doctor_id = @doctor.id
    @prescription.patient_id = appointment.patient_id
    @prescription.appointment_id = appointment.id
    @prescription.status = "active"

    @prescription.prescription_no ||=
      generate_prescription_number

    if @prescription.save
      redirect_to doctor_prescription_path(@prescription),
                  notice: "Prescription saved successfully."
    else
      load_appointments

      # Rebuild empty rows only if validation fails
      if @prescription.prescription_medicines.empty?
        10.times do
          @prescription.prescription_medicines.build
        end
      end

      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def authenticate_doctor
    @doctor = User.find_by(id: session[:user_id])

    unless @doctor && @doctor.role == "doctor"
      redirect_to doctor_login_path,
                  alert: "Please login as doctor."
    end
  end

  def set_prescription
    @prescription = Prescription
      .where(doctor_id: @doctor.id)
      .includes(
        :patient,
        :appointment,
        :prescription_medicines
      )
      .find(params[:id])
  end

  def load_appointments
    @appointments = Appointment
      .where(doctor_id: @doctor.id)
      .where(status: ["confirmed", "completed"])
      .where.not(patient_id: nil)
      .includes(:patient)
      .order(appointment_date: :desc)
  end

  def prescription_params
    params.require(:prescription).permit(
      :appointment_id,
      :diagnosis,
      :blood_pressure,
      :pulse_rate,
      :description_of_disease,
      :tests,
      :advice,
      :notes,
      prescription_medicines_attributes: [
        :id,
        :medicine_name,
        :dosage,
        :strength,
        :quantity,
        :frequency,
        :duration,
        :instructions,
        :remarks
      ]
    )
  end

  def generate_prescription_number
    "RX-#{Time.current.strftime('%Y%m%d%H%M%S')}"
  end
end