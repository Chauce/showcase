class AddCampIdToForecast < ActiveRecord::Migration[6.1]
  def change
    add_column :forecasts, :camp_id, :integer
  end
end
