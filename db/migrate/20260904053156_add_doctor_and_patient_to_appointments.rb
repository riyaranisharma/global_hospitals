class AddDoctorAndPatientToAppointments < ActiveRecord::Migration[8.1]
  def change
    add_reference :appointments, :doctor,
                  foreign_key: { to_table: :users },
                  null: true
  end
end