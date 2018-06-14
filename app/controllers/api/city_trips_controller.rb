class Api::CityTripsController < ApplicationController
  def index
    @city_trips = CityTrip.all

    render 'index.json.jbuilder'
  end

  def show
    city_trip_id = params[:id]
    @city_trip = CityTrip.find(city_trip_id)
    render 'show.json.jbuilder'
  end

  def create
    @city_trip = CityTrip.new(
                              city_id: params[:city_id],
                              trip_id: params[:trip_id]
                              )
    @city_trip.save
    render 'show.json.jbuilder'
  end

  def update
    city_trip_id = params[:id]
    @city_trip = CityTrip.find(city_trip_id)

    @city_trip.city_id = params[:city_id] || @city_trip.city_id
    @city_trip.trip_id = params[:trip_id] || @city_trip.trip_id

    if @city_trip.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @city_trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    city_trip_id = params[:id]
    @city_trip = CityTrip.find(city_trip_id)
    @city_trip.destroy
    render json: {message: "City Trip Successfully Destroyed"}
  end
end
