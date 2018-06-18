class Api::TripsController < ApplicationController
  def index
    @trips = Trip.all

    render 'index.json.jbuilder'
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find(trip_id)
    render 'show.json.jbuilder'
  end

  def create
    @trip = Trip.new(
                      user_id: current_user.id,
                      trip.city => params[:city],
                      trip.state => params[:state],
                      climate: params[:climate],
                      start_date: params[:start_date],
                      end_date: params[:end_date]
                    )
    @trip.save
    render 'show.json.jbuilder'
  end

  def update
    trip_id = params[:id]
    @trip = Trip.find(trip_id)

    @trip.climate = params[:climate] || @trip.name
    @trip.start_date = params[:start_date] || @trip.start_date
    @trip.end_date = params[:end_date] || @trip.end_date

    if @trip.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    trip_id = params[:id]
    @trip = Trip.find(trip_id)
    @trip.destroy
    render json: {message: "Trip successfully destroyed."}
  end
end
