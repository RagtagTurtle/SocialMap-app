class City < ApplicationRecord
  has_many :city_trips
  has_many :trips, through: :city_trips

  belongs_to :geography, optional: true

  has_many :recommendations

end
