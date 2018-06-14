class TripActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :trip
end
