class TripVibe < ApplicationRecord
  belongs_to :user
  belongs_to :vibe
  belongs_to :trip
end
