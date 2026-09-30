class CreateDoctorSchedules < ActiveRecord::Migration[8.1]
  def change
    create_table :doctor_schedules do |t|
      t.references :doctor,
                   null: false,
                   foreign_key: {
                     to_table: :users
                   }

      t.string :day_of_week, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.time :break_start
      t.time :break_end
      t.integer :slot_duration, null: false
      t.string :status, default: "active", null: false

      t.timestamps
    end
  end
end