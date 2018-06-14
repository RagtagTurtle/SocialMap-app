class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :trip
end
