class MedicalReport < ApplicationRecord
  belongs_to :patient,
             class_name: "User",
             foreign_key: :patient_id

  belongs_to :doctor,
             class_name: "User",
             foreign_key: :doctor_id,
             optional: true

  has_many :test_results,
           dependent: :destroy

  has_one_attached :report_file

  validates :doctor_name, presence: true
  validates :department, presence: true
  validates :report_type, presence: true
  validates :report_date, presence: true
  validates :status, presence: true
end