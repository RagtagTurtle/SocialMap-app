class User < ApplicationRecord
  has_secure_password

  has_many :trips
  has_many :trip_activities, through: :trips
end
