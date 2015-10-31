class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.string :name
      t.integer :guest_count, :default => 0

      t.timestamps null: false
    end
  end
end
