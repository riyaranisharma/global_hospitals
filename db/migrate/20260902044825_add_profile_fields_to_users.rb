class AddProfileFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :blood_group, :string
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :pin_code, :string
    add_column :users, :alternate_phone, :string
    add_column :users, :emergency_contact_name, :string
    add_column :users, :emergency_relationship, :string
    add_column :users, :emergency_phone, :string
    add_column :users, :marital_status, :string
    add_column :users, :nationality, :string
    add_column :users, :preferred_language, :string
    add_column :users, :allergies, :text
    add_column :users, :chronic_conditions, :text
    add_column :users, :current_medications, :text
    add_column :users, :smoking_status, :string
    add_column :users, :alcohol_consumption, :string
  end
end
