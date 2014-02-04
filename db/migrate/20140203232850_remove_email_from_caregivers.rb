class RemoveEmailFromCaregivers < ActiveRecord::Migration
  def change
    remove_column :caregivers, :email, :string
  end
end
