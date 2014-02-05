class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :patient_id
      t.text :message

      t.timestamps
    end
  end
end
