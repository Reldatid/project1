class AddFieldsToLocations < ActiveRecord::Migration[5.2]
  def change
      add_column :locations, :universe, :text
      add_column :locations, :branch, :text
  end
end
