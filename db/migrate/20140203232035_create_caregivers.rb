class CreateCaregivers < ActiveRecord::Migration
  def change
    create_table :caregivers do |t|
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
