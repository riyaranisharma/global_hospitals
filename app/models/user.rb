class User < ApplicationRecord

  has_secure_password

  # Medical Reports
  has_many :medical_reports,
           foreign_key: :patient_id,
           dependent: :destroy

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true

  validates :phone, presence: true

  has_many :appointments,
           foreign_key: :patient_id,
           dependent: :nullify

  has_many :doctor_appointments,
           class_name: "Appointment",
           foreign_key: :doctor_id,
           dependent: :nullify


  has_many :doctor_schedules,
         class_name: "DoctorSchedule",
         foreign_key: "doctor_id",
         dependent: :destroy

  has_many :doctor_prescriptions,
         class_name: "Prescription",
         foreign_key: "doctor_id",
         dependent: :destroy

has_many :patient_prescriptions,
         class_name: "Prescription",
         foreign_key: "patient_id",
         dependent: :destroy

end