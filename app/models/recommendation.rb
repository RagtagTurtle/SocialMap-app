class Recommendation < ApplicationRecord
  # belongs_to :user [i don't think this is necessary]
  belongs_to :city
  belongs_to :trip

  enum category: {restaurants: 0, tourist_attractions: 1, museums_or_other_educational: 2, shopping: 3, night_life: 4, outdoor_activity: 5}
end
