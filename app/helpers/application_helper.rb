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

# def find_closest_stations(args)
#   Station.all.each do |station|
#     distance = google_walking_directions(args[:location], "#{station.latitude},#{station.longitude}")
#   end

#   if args[:type]=="start"
#     Station.all.each do |station|
#       distance = google_walking_directions(start: args[:location], "#{station.latitude},#{station.longitude}")
#     end
#   elsif args[:type]=="destination"
#     Station.all.each do |station|
#       distance = google_walking_directions("#{station.latitude},#{station.longitude}", args[:location])
#     end
#   end
# end


end
