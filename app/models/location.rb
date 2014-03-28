class Location < ActiveRecord::Base
  has_many :favorites
  has_many :lists, through: :favorites


  # def self.party(search_url)
    
  #   response = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?reference=CmRYAAAAciqGsTRX1mXRvuXSH2ErwW-jCINE1aLiwP64MCWDN5vkXvXoQGPKldMfmdGyqWSpm7BEYCgDm-iv7Kc2PF7QA7brMAwBbAcqMr5i1f4PwTpaovIZjysCEZTry8Ez30wpEhCNCXpynextCld2EBsDkRKsGhSLayuRyFsex6JA6NPh9dyupoTH3g&sensor=true&key=AIzaSyAzxH8eKAW9zPrmvdTYkihBrhJqO0fR5tk")
  # end


end


