class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.string :doctor_name
      t.string :department
      t.date :appointment_date
      t.time :appointment_time
      t.string :status

      t.timestamps
    end
  end
end
