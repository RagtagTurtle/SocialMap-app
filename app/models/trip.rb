class Trip < ApplicationRecord
  belongs_to :user

  has_many :city_trips
  has_many :cities, through: :city_trips

  has_many :trip_activities
  has_many :activities, through: :trip_activities

  has_many :trip_vibes
  has_many :vibes, through: :trip_vibes

  has_many :recommendations

  enum climate: {hot: 0, warm: 1, mild: 2, crisp: 3, cold: 4}

  has_attached_file :image

  validates_attachment :image,
    content_type: {
      content_type: ["image/jpeg", "image/gif", "image/png"]
    }

  def friendly_start_date
    start_date.strftime("%m/%d/%Y")
  end

  def friendly_end_date
    end_date.strftime("%m/%d/%Y")
  end

  def climate_uppercase
    climate.capitalize
  end

  def first_city_trip
    city_trips.order(:created_at).first || CityTrip.new
  end

  def name
    city_trips.order(:created_at).first.city.name if city_trips.any?
  end

  def city_integer
    city_trips.order(:created_at).first.city.id if city_trips.any?
  end

  def state_name
    city_trips.order(:created_at).first.city.state if city_trips.any?
  end

  def latitude
    city_trips.order(:created_at).first.city.latitude if city_trips.any?
  end

  def longitude
    city_trips.order(:created_at).first.city.longitude if city_trips.any?
  end

  def self.search(options)
    city_score = 0

    if options[:climate]
      @filtered_trips = Trip.where("climate = '#{options[:climate]}") # this returns all trips (in array w/ hashes) where the climate is ____ . does this work with params?
    end

    # @vibe_search = Vibe.where("vibe_id = '#{options[:vibes]}'")
    # @vibe_search.trips

    # @activities_search = Activity.where("activity_id = '#{options[:activities]}'")
    # @activities_search.trips

    # if Trip.where("climate = '#{params[:climate]}")
    #   city_score += 5
    # end
  end
end
