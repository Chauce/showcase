class CreateForecasts < ActiveRecord::Migration[6.1]
  def change
    create_table :forecasts do |t|
      t.decimal :temp
      t.string :lat
      t.string :long
      t.decimal :snow
      t.decimal :precip
      t.timestamp :timestamp_utc

      t.timestamps
    end
  end
end
