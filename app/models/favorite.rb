class Favorite < ActiveRecord::Base
  belongs_to :location
  belongs_to :list
end
