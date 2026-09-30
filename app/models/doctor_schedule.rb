class DoctorSchedule < ApplicationRecord
  belongs_to :doctor,
             class_name: "User",
             foreign_key: "doctor_id"

  validates :day_of_week, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :slot_duration, presence: true

  validates :status, inclusion: {
    in: %w[active inactive]
  }
end