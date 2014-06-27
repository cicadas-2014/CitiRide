class BikeStation
  attr_accessor :id, :station_name, :available_docks, :total_docks, :latitude, :longitude, :available_bikes

  def initialize(args)
    @id = args.fetch(:id)
    @station_name = args.fetch(:station_name)
    @available_docks = args.fetch(:available_docks)
    @total_docks = args.fetch(:total_docks)
    @latitude = args.fetch(:latitude)
    @longitude = args.fetch(:longitude)
    @available_bikes = args.fetch(:available_bikes)
  end
end

class City
  attr_accessor :city_name, :list_stations

  def initialize(args)
    @city_name = args.fetch(:city_name)
    @list_stations = args.fetch(:list_stations)
  end
end

class Controller
  attr_accessor :json_response, :city
  def initialize
    get_json_data
    create_bike_station_objects
    @bike_stations = []
  end

  def get_json_data
    uri = URI.parse("http://www.citibikenyc.com/stations/json")
    res = Net::HTTP.get_response(uri)
    body = res.body
    @json_response = JSON.parse(body)
  end

  def create_bike_station_objects
    json_hash = @json_response["stationBeanList"]
    json_hash.each { |bike| @bike_stations << BikeStation.new(assign_bike_station_properties(bike)) }
    seed_city_stations
  end

  def seed_city_stations(city_stations)
    @city = City.new({ city_name: "New York", list_stations: @bike_stations })
    seed_database
  end

  def assign_bike_station_properties(bike_json)
    args = {  id: bike_json["id"],
              station_name: bike_json["stationName"],
              available_docks: bike_json["availableDocks"],
              total_docks: bike_json["totalDocks"],
              latitude: bike_json["latitude"],
              longitude: bike_json["longitude"],
              available_bikes: bike_json["available_bikes"] }
  end

  def seed_database
    @city.list_stations.each do |station|
      Station.create(name: station.station_name, latitude: station.latitude, longitude: station.longitude)
    end
  end
end
