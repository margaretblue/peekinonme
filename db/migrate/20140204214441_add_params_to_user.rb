class AddParamsToUser < ActiveRecord::Migration
  def change
    add_column :users, :caregiver_name, :string
    add_column :users, :patient_name, :string
    add_column :users, :caregiver_phone, :string
    add_column :users, :patient_phone, :string
    add_column :users, :patient_email, :string
    add_column :users, :patient_street, :string
    add_column :users, :patient_city, :string
    add_column :users, :patient_zip, :string
    add_column :users, :checkintime, :time
    add_column :users, :patient_condition, :text
    add_column :users, :patient_token, :string
  end
end
