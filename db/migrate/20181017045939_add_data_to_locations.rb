class AddDataToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :public_notes, :text
    add_column :locations, :dm_notes, :text
  end
end
