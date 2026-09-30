class CreateMedicalRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :medical_records do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.string :record_type
      t.string :title
      t.text :description
      t.text :diagnosis
      t.text :treatment
      t.text :notes
      t.date :record_date
      t.string :status

      t.timestamps
    end
  end
end
