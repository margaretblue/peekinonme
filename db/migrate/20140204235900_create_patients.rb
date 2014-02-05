class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :street
      t.string :city
      t.string :zip
      t.string :phone
      t.text :condition
      t.time :checkintime

      t.timestamps
    end
  end
end
