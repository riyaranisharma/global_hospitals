Rails.application.routes.draw do
  get "doctor_prescriptions/index"
  get "doctor_prescriptions/new"
  get "doctor_prescriptions/create"
  get "doctor_prescriptions/show"
  get "doctor_schedules/index"
  get "doctor_schedules/new"
  get "doctor_schedules/edit"
  get "doctor_schedule/index"
  get "doctor_schedule/show"
  get "doctor_schedule/new"
  get "doctor_schedule/edit"

  # =====================
  # HOME
  # =====================

  root "home#index"

  get "/about",
      to: "pages#about",
      as: :about

  get "/contact",
      to: "pages#contact",
      as: :contact


  # =====================
  # PATIENT REGISTRATION
  # =====================

  get "/register",
      to: "registrations#new",
      as: :register

  post "/register",
       to: "registrations#create"


  # =====================
  # PATIENT LOGIN
  # =====================

  get "/login",
      to: "sessions#new",
      as: :login

  post "/login",
       to: "sessions#create"


  # =====================
  # PATIENT DASHBOARD
  # =====================

  get "/patient/dashboard",
      to: "dashboards#patient",
      as: :patient_dashboard


  # =====================
  # PATIENT PROFILE
  # =====================

  get "/patient/profile",
      to: "patient_profiles#index",
      as: :patient_profile

  get "/patient/profile/edit",
      to: "patient_profiles#edit",
      as: :edit_patient_profile

  patch "/patient/profile",
        to: "patient_profiles#update"


  # =====================
  # PATIENT APPOINTMENTS
  # =====================

  resources :appointments


  # =====================
  # MEDICAL RECORDS
  # =====================

  resources :medical_records,
            only: [:index, :show, :new, :create, :edit, :update]


  # =====================
  # PRESCRIPTIONS
  # =====================

  resources :prescriptions


  # =====================
  # LAB REPORTS
  # =====================

  resources :lab_reports


  # =====================
  # BILLS
  # =====================

  resources :bills


  # =====================
  # PATIENT SETTINGS
  # =====================

  get "/patient/settings",
      to: "settings#index",
      as: :settings

  get "/patient/settings/edit",
      to: "settings#edit",
      as: :edit_settings

  patch "/patient/settings",
        to: "settings#update"


  # =====================
  # DOCTOR LOGIN
  # =====================

  get "/doctor/login",
      to: "doctor_sessions#new",
      as: :doctor_login

  post "/doctor/login",
       to: "doctor_sessions#create"


  # =====================
  # DOCTOR DASHBOARD
  # =====================

  get "/doctor/dashboard",
      to: "doctor_dashboard#index",
      as: :doctor_dashboard


  # =====================
  # DOCTOR APPOINTMENTS
  # =====================

  resources :doctor_appointments,
            only: [:index] do

    member do
      patch :confirm
      patch :reject
    end

  end


  # =====================
  # DOCTOR PATIENTS
  # =====================
resources :doctor_prescriptions,
          path: "doctor/prescriptions",
          only: [:index, :new, :create, :show]
  resources :doctor_patients,
            only: [:index]

  resources :doctor_schedules


  # =====================
  # DOCTOR FORGOT PASSWORD
  # =====================

  get "/doctor/forgot-password",
      to: "doctor_passwords#new",
      as: :doctor_forgot_password

  post "/doctor/forgot-password",
       to: "doctor_passwords#create"

  get "/doctor/reset-password",
      to: "doctor_passwords#edit",
      as: :doctor_reset_password

  patch "/doctor/reset-password",
        to: "doctor_passwords#update"


  # =====================
  # DOCTOR REPORTS
  # =====================

  get "/doctor/reports",
      to: "doctor_reports#index",
      as: :doctor_reports


  # =====================
  # ADMIN LOGIN
  # =====================

  get "/admin/login",
      to: "admin_sessions#new",
      as: :admin_login

  post "/admin/login",
       to: "admin_sessions#create"


  # =====================
  # ADMIN DASHBOARD
  # =====================

  get "/admin/dashboard",
      to: "admin_dashboard#index",
      as: :admin_dashboard


  # =====================
  # ADMIN FORGOT PASSWORD
  # =====================

  get "/admin/forgot-password",
      to: "admin_passwords#new",
      as: :admin_forgot_password

  post "/admin/forgot-password",
       to: "admin_passwords#create"

  get "/admin/reset-password",
      to: "admin_passwords#edit",
      as: :admin_reset_password

  patch "/admin/reset-password",
        to: "admin_passwords#update"


 # =====================
# ADMIN MODULES
# =====================

get "/admin/doctors",
    to: "admin_doctors#index",
    as: :admin_doctors

get "/admin/patients",
    to: "admin_patients#index",
    as: :admin_patients

get "/admin/appointments",
    to: "admin_appointments#index",
    as: :admin_appointments

get "/admin/medical-records",
    to: "admin_medical_records#index",
    as: :admin_medical_records

get "/admin/lab-reports",
    to: "admin_lab_reports#index",
    as: :admin_lab_reports

get "/admin/bills",
    to: "admin_bills#index",
    as: :admin_bills

get "/admin/reports",
    to: "admin_reports#index",
    as: :admin_reports

get "/admin/settings",
    to: "admin_settings#index",
    as: :admin_settings
  # =====================
  # LOGOUT
  # =====================

  delete "/logout",
        to: "sessions#destroy",
        as: :logout

end