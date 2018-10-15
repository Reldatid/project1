class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :location_id
      t.text :data

      t.timestamps
    end
  end
end
