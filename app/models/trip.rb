class Trip < ApplicationRecord
  belongs_to :user
  # has_many :cities
  # has_many :city_trips, through: :cities [i believe the below is correct.]

  has_many :city_trips
  has_many :cities, through: :city_trips

  has_many :trip_activities
  has_many :activities, through: :trip_activities

  has_many :trip_vibes
  has_many :vibes, through: :trip_vibes

  has_many :recommendations
end
