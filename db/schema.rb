# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_09_11_060931) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.date "appointment_date"
    t.time "appointment_time"
    t.datetime "created_at", null: false
    t.string "department"
    t.bigint "doctor_id"
    t.string "doctor_name"
    t.integer "patient_id"
    t.string "patient_name"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
  end

  create_table "doctor_schedules", force: :cascade do |t|
    t.time "break_end"
    t.time "break_start"
    t.datetime "created_at", null: false
    t.string "day_of_week", null: false
    t.bigint "doctor_id", null: false
    t.time "end_time", null: false
    t.integer "slot_duration", null: false
    t.time "start_time", null: false
    t.string "status", default: "active", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_schedules_on_doctor_id"
  end

  create_table "medical_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.text "diagnosis"
    t.integer "doctor_id"
    t.text "notes"
    t.integer "patient_id"
    t.date "record_date"
    t.string "record_type"
    t.string "status"
    t.string "title"
    t.text "treatment"
    t.datetime "updated_at", null: false
  end

  create_table "medical_reports", force: :cascade do |t|
    t.text "clinical_notes"
    t.datetime "created_at", null: false
    t.string "department"
    t.integer "doctor_id"
    t.string "doctor_name"
    t.boolean "fasting"
    t.text "interpretation"
    t.string "lab_no"
    t.bigint "patient_id"
    t.text "recommendations"
    t.string "report_code"
    t.date "report_date"
    t.string "report_type"
    t.datetime "sample_collected_at"
    t.string "sample_type"
    t.string "status"
    t.text "summary"
    t.datetime "updated_at", null: false
    t.date "visit_date"
    t.index ["patient_id"], name: "index_medical_reports_on_patient_id"
  end

  create_table "prescription_medicines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "dosage", null: false
    t.string "duration", null: false
    t.string "frequency", null: false
    t.text "instructions"
    t.string "medicine_name", null: false
    t.bigint "prescription_id", null: false
    t.string "quantity"
    t.string "remarks"
    t.string "strength"
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_prescription_medicines_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.text "advice"
    t.bigint "appointment_id"
    t.string "blood_pressure"
    t.datetime "created_at", null: false
    t.text "description_of_disease"
    t.text "diagnosis"
    t.bigint "doctor_id", null: false
    t.text "notes"
    t.bigint "patient_id", null: false
    t.string "prescription_no"
    t.string "pulse_rate"
    t.string "status", default: "active", null: false
    t.text "tests"
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_prescriptions_on_appointment_id"
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "test_results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "medical_report_id", null: false
    t.string "reference_range"
    t.string "result"
    t.string "status"
    t.string "test_name"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.index ["medical_report_id"], name: "index_test_results_on_medical_report_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "address"
    t.string "alcohol_consumption"
    t.text "allergies"
    t.string "alternate_phone"
    t.string "blood_group"
    t.text "chronic_conditions"
    t.string "city"
    t.datetime "created_at", null: false
    t.text "current_medications"
    t.date "date_of_birth"
    t.string "email"
    t.string "emergency_contact_name"
    t.string "emergency_phone"
    t.string "emergency_relationship"
    t.string "first_name"
    t.string "gender"
    t.string "last_name"
    t.string "marital_status"
    t.string "nationality"
    t.string "password_digest"
    t.string "phone"
    t.string "pin_code"
    t.string "preferred_language"
    t.string "role"
    t.string "smoking_status"
    t.string "state"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "users", column: "doctor_id"
  add_foreign_key "doctor_schedules", "users", column: "doctor_id"
  add_foreign_key "medical_reports", "users", column: "patient_id"
  add_foreign_key "prescription_medicines", "prescriptions"
  add_foreign_key "prescriptions", "appointments"
  add_foreign_key "prescriptions", "users", column: "doctor_id"
  add_foreign_key "prescriptions", "users", column: "patient_id"
  add_foreign_key "test_results", "medical_reports"
end
