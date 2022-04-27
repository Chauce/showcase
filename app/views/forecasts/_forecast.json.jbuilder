json.extract! forecast, :id, :temp, :lat, :long, :snow, :precip, :timestamp_utc, :created_at, :updated_at
json.url forecast_url(forecast, format: :json)
