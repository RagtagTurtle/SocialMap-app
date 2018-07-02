class Api::TripsController < ApplicationController
  def index
    @trips = Trip.all

    @recommended_trips = []

    # Filter trips by Vibes
    vibe_name = params[:vibe]
    if vibe_name
      vibe = Vibe.find_by(name: vibe_name)
      @trips = vibe.trips
    end

    # Filter trips by Activities
    activity_name = params[:activity]
    if activity_name
      activity = Activity.find_by(name: activity_name)
      @trips = activity.trips
    end

    # if params[:climate]
    #   @trips = Trip.where(climate: params[:climate])
    # end

    if params[:vibes]
      @trips = Trip.where("vibes = #{params[:vibes]}")
    end

    # if params[:activities]
    #   @recommended_trips = Trip.where("activities = #{params[:acitivity]}")
    # end

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
