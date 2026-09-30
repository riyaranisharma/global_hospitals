class CreateMedicalReports < ActiveRecord::Migration[8.1]
  def change
    create_table :medical_reports do |t|
      t.bigint :patient_id
      t.string :doctor_name
      t.string :department
      t.string :report_type
      t.date :report_date
      t.string :status
      t.text :summary

      t.timestamps
    end

    add_foreign_key :medical_reports, :users, column: :patient_id
    add_index :medical_reports, :patient_id
  end
end