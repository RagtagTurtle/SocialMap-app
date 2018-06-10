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
                      user_id: current_user.id
                      climate: params[:climate],
                      start_date: params[:start_date],
                      end_date: params[:end_date]
                    )
    @trip.save
    puts "*********************"
    p @trip.errors.full_messages
    puts "*********************"
    render 'show.json.jbuilder'
  end
end
