module ApplicationHelper
#   def google_walking_directions(args)
#     options = {
#       languange: :en,
#       alternative: :true,
#       sensor: :false,
#       mode: :walking
#     }
#     GoogleDirections.new(args[:start],args[:destination],options)
#   end

#   def google_biking_directions(args)
#     options = {
#       languange: :en,
#       alternative: :true,
#       sensor: :false,
#       mode: :biking
#     }
#     GoogleDirections.new(args[:start],args[:destination],options)
#   end

#   # args = {location: "Address", type: "start"}
# # args = {location: "Address", type: "destination"}

def find_closest_bike(args)
  station_list = get_station_list
  closest = station_list.first
  args[:start]
  station_list.each do |station|
    if google_walking_directions(start: args[:start], destination: "#{station.latitude},#{station.longitude}").distance < google_walking_directions(start: args[:start], "#{closest.latitude},#{closest.longitude}").distance && station.availableBikes > 1
      closest = station
    end
  end
  closest
end

def find_closest_bike(args)
  station_list = get_station_list
  closest = station_list.first
  args[:start]
  station_list.each do |station|
    if google_walking_directions(start: args[:start], destination: "#{station.latitude},#{station.longitude}").distance < google_walking_directions(start: args[:start], "#{closest.latitude},#{closest.longitude}").distance && station.availableDocks > 1
      closest = station
    end
  end
  closest
end

def get_station_list
  uri = URI.parse("http://www.citibikenyc.com/stations/json")
  res = Net::HTTP.get_response(uri)
  json_response = JSON.parse(res.body)
  json_response["stationBeanList"]
end

end
