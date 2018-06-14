class Trip < ApplicationRecord
  belongs_to :user

  has_many :city_trips
  has_many :cities, through: :city_trips

  has_many :trip_activities
  has_many :activities, through: :trip_activities

  has_many :trip_vibes
  has_many :vibes, through: :trip_vibes

  has_many :recommendations

  enum category: {hot: 0, warm: 1, mild: 2, crisp: 3, cold: 4}
end
