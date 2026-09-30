class Appointment < ApplicationRecord
  belongs_to :doctor,
             class_name: "User",
             foreign_key: "doctor_id",
             optional: true

  belongs_to :patient,
             class_name: "User",
             foreign_key: "patient_id",
             optional: true
end