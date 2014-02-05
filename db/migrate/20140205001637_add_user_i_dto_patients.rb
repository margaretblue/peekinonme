class AddUserIDtoPatients < ActiveRecord::Migration
  def change
    add_column :patients, :caregiver_id, :integer
  end
end
