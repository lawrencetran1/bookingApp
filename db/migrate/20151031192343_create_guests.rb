class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :plus_one
      t.references :timeslot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
