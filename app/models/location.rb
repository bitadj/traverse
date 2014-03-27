require 'google_places'

class Location < ActiveRecord::Base
  has_many :favorites
  has_many :lists, through: :favorites


  def self.refresh(api_key)
    client = GooglePlaces::Client.new(api_key)
    spots = client.spots(51.5171, 0.1062, :radius => 50000, :name => 'chicken', :radar => true);
    spots.each do |spot|
      shop = Shop.find_or_initialize_by(place_id: spot.id)
      shop.update_attributes :name => spot.name, :latitude => spot.lat, :longitude => spot.lng
    end
  end

end
