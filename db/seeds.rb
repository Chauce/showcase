# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest_client'

#Get response from National Parks Service API
response = RestClient.get 'https://developer.nps.gov/api/v1/campgrounds?parkCode=acad&api_key=TKu49ihovDW2zmrCoeCNrgYy9vVZs66BvvTjibpG'
#Parse response
result = JSON.parse(response)
#Data for sites
sites = result["data"]

# puts result

#Seed Camps from National Parks Service API
#If the response we got wasn't nil
if !result.nil?
  sites.each do |site|
    puts "Seeding CAMPS..."
    Camp.create(
      name: site["name"],
      latLong: site["latLong"],
      latitude: site["latitude"],
      longitude: site["longitude"],
      weatheroverview: site["weatherOverview"]
    )
  end
else
  #if the response we got was nil
  puts "Error encountered when seeding Camps."
end


# Makes more sense to do this dynamically via Javascript in front end display,
# or as a cron job that updates on server initialization and then again every
# X number of minutes

# #Seed Forecast
# def find_weather(latitude, longitude)
#   latlon = URI.encode("lat=#{latitude}&lon=#{longitude}")
#   weather = RestClient.get "https://weatherbit-v1-mashape.p.rapidapi.com/forecast/minutely?#{latlon}}"
# end
#
# #Chron Job
# #Iterate thorugh all Camp objects
# #do call to Forecast API and pass it lat/long for search
# #get back a Hourly Forecast object
# #populate
# Camp.all.each do |camp|
#   lat = camp.lat
#   long = camp.long
#
#   weather = find_weather(lat, long)
#   json = JSON.parse(weather)
#   hourly = json["data"]
#   puts "Seeding FORECASTS..."
#   Forecast.create(
#     temp: hourly["temp"]
#     lat: hourly["lat"]
#     long: hourly["long"]
#     snow: hourly["snow"]
#     precip: hourly["precip"]
#     camp_id: camp.camp_id
#   )
# end
