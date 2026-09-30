class MedicalRecordsController < ApplicationController

  def index
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @medical_reports = MedicalReport
      .includes(:test_results)
      .where(patient_id: @patient.id)
      .order(report_date: :desc)
  end


  def show
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @medical_report = MedicalReport
      .includes(:test_results)
      .find_by(
        id: params[:id],
        patient_id: @patient.id
      )

    unless @medical_report
      redirect_to medical_records_path,
                  alert: "Medical report not found."
      return
    end
  end


  # Upload page
  def new
    @medical_report = MedicalReport.new
  end


  # Save uploaded report + information
  def create
    @patient = User.find_by(id: session[:user_id])

    unless @patient
      redirect_to login_path, alert: "Please login first."
      return
    end

    @medical_report = MedicalReport.new(medical_report_params)

    # Patient automatically comes from login session
    @medical_report.patient_id = @patient.id

    if @medical_report.save

      redirect_to medical_record_path(@medical_report),
                  notice: "Medical report uploaded successfully."

    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @patient = User.find_by(id: session[:user_id])

    @medical_report = MedicalReport.find_by(
      id: params[:id],
      patient_id: @patient&.id
    )

    unless @medical_report
      redirect_to medical_records_path,
                  alert: "Medical report not found."
      return
    end
  end


  def update
    @patient = User.find_by(id: session[:user_id])

    @medical_report = MedicalReport.find_by(
      id: params[:id],
      patient_id: @patient&.id
    )

    unless @medical_report
      redirect_to medical_records_path,
                  alert: "Medical report not found."
      return
    end

    if @medical_report.update(medical_report_params)
      redirect_to medical_record_path(@medical_report),
                  notice: "Medical report updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def medical_report_params
    params.require(:medical_report).permit(
      :doctor_id,
      :doctor_name,
      :department,
      :report_type,
      :report_date,
      :status,
      :summary,
      :report_code,
      :lab_no,
      :sample_collected_at,
      :visit_date,
      :sample_type,
      :fasting,
      :clinical_notes,
      :interpretation,
      :recommendations,
      :report_file
    )
  end

end