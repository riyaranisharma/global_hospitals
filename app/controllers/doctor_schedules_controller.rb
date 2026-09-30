class DoctorSchedulesController < ApplicationController
  before_action :authenticate_doctor
  before_action :set_schedule, only: [:edit, :update, :destroy]

  def index
    @schedules = DoctorSchedule
      .where(doctor_id: @doctor.id)
      .order(:day_of_week, :start_time)
  end

  def new
    @schedule = DoctorSchedule.new
  end

  def create
    @schedule = DoctorSchedule.new(schedule_params)
    @schedule.doctor_id = @doctor.id
    @schedule.status = "active"

    if @schedule.save
      redirect_to doctor_schedules_path,
                  notice: "Schedule created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to doctor_schedules_path,
                  notice: "Schedule updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy

    redirect_to doctor_schedules_path,
                notice: "Schedule deleted successfully."
  end

  private

  def authenticate_doctor
    @doctor = User.find_by(id: session[:user_id])

    unless @doctor && @doctor.role == "doctor"
      redirect_to doctor_login_path,
                  alert: "Please login as doctor."
    end
  end

  def set_schedule
    @schedule = DoctorSchedule.find_by(
      id: params[:id],
      doctor_id: @doctor.id
    )

    unless @schedule
      redirect_to doctor_schedules_path,
                  alert: "Schedule not found."
    end
  end

  def schedule_params
    params.require(:doctor_schedule).permit(
      :day_of_week,
      :start_time,
      :end_time,
      :break_start,
      :break_end,
      :slot_duration,
      :status
    )
  end
end