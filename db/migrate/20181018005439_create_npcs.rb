class CreateNpcs < ActiveRecord::Migration[5.2]
  def change
    create_table :npcs do |t|
      t.text :name
      t.text :title
      t.text :description
      t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
