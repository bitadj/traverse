class Favorite < ActiveRecord::Base
  belongs_to :location
  belongs_to :list
end
# validate that list and location pair dont already exist