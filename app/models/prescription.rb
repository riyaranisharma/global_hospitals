class Prescription < ApplicationRecord
  belongs_to :doctor,
             class_name: "User",
             foreign_key: "doctor_id"

  belongs_to :patient,
             class_name: "User",
             foreign_key: "patient_id"

  belongs_to :appointment,
             optional: true

  has_many :prescription_medicines,
           dependent: :destroy

  accepts_nested_attributes_for :prescription_medicines
end