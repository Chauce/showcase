class CreateCamps < ActiveRecord::Migration[6.1]
  def change
    create_table :camps do |t|
      t.string :name
      t.string :latLong
      t.string :latitude
      t.string :longitude
      t.string :weatheroverview

      t.timestamps
    end
  end
end
