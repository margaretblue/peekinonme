class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :phone
      t.string :street
      t.string :city
      t.string :zip
      t.text :condition
      t.datetime :checkintime

      t.timestamps
    end
  end
end
