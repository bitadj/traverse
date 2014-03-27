class Location < ActiveRecord::Base
  has_many :favorites
  has_many :lists, through: :favorites

end
