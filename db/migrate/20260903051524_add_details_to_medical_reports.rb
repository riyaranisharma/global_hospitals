class AddDetailsToMedicalReports < ActiveRecord::Migration[8.1]
  def change
    add_column :medical_reports, :doctor_id, :integer
    add_column :medical_reports, :report_code, :string
    add_column :medical_reports, :lab_no, :string
    add_column :medical_reports, :sample_collected_at, :datetime
    add_column :medical_reports, :visit_date, :date
    add_column :medical_reports, :sample_type, :string
    add_column :medical_reports, :fasting, :boolean
    add_column :medical_reports, :clinical_notes, :text
    add_column :medical_reports, :interpretation, :text
    add_column :medical_reports, :recommendations, :text
  end
end
