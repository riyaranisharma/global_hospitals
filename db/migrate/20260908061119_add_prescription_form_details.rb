class AddPrescriptionFormDetails < ActiveRecord::Migration[8.1]
  def change
    add_column :prescriptions, :prescription_no, :string
    add_column :prescriptions, :blood_pressure, :string
    add_column :prescriptions, :pulse_rate, :string
    add_column :prescriptions, :description_of_disease, :text
    add_column :prescriptions, :tests, :text
    add_column :prescriptions, :advice, :text

    add_column :prescription_medicines, :strength, :string
    add_column :prescription_medicines, :quantity, :string
    add_column :prescription_medicines, :remarks, :string
  end
end