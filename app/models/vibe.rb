class Vibe < ApplicationRecord
  has_many :trip_vibes
  has_many :trips, through: :trip_vibes
end
