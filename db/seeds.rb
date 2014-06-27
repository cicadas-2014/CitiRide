require 'json'
require 'net/http'
require 'uri'

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
    create_bike_objects
  end

  def get_json_data
    uri = URI.parse("http://www.citibikenyc.com/stations/json")
    res = Net::HTTP.get_response(uri)
    body = res.body
    @json_response = JSON.parse(body)
  end

  def create_bike_objects
    city_stations = []
    json_hash = @json_response["stationBeanList"]
    json_hash.each do |bike|
      bike_args = create_bike_args(bike)
      bike_station = BikeStation.new(bike_args)
      city_stations << bike_station
    end
    @city = City.new({city_name: "New York", list_stations: city_stations})
    seed_database(@city)
  end

  def create_bike_args(bike_json)
    station_id = bike_json["id"]
    station_name = bike_json["stationName"]
    available_docks = bike_json["availableDocks"]
    total_docks = bike_json["totalDocks"]
    latitude = bike_json["latitude"]
    longitude = bike_json["longitude"]
    available_bikes = bike_json["available_bikes"]
    args = {id: station_id, station_name: station_name, available_docks: available_docks, total_docks: total_docks, latitude: latitude, longitude: longitude, available_bikes: available_bikes}
  end

  def seed_database(city)
    city.list_stations.each do |station|
      Station.create(name: station.station_name, latitude: station.latitude, longitude: station.longitude)
    end
  end
end

controller = Controller.new
