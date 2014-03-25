class List < ActiveRecord::Base
  has_many :favorites
  has_many :locations, through: :favorites
  belongs_to :user
end
