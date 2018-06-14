class Api::TripVibesController < ApplicationController
  def index
    @trip_vibes = TripVibe.all
    render 'index.json.jbuilder'
  end

  def show
    trip_vibe_id = params[:id]
    @trip_vibe = TripVibe.find(trip_vibe_id)
    render 'show.json.jbuilder'
  end

  def create
    @trip_vibe = TripVibe.new(
                              trip_id: params[:trip_id],
                              vibe_id: params[:vibe_id]
                              )
    @trip_vibe.save
    render 'show.json.jbuilder'
  end

  def update
    trip_vibe_id = params[:id]
    @trip_vibe = TripVibe.find(trip_vibe_id)

    @trip_vibe.trip_id = params[:trip_id] || @trip_vibe.trip_id
    @trip_vibe.vibe_id = params[:vibe_id] || @trip_vibe.vibe_id

    if @trip_vibe.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @trip_vibe.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    trip_vibe_id = params[:id]
    @trip_vibe = TripVibe.find(trip_vibe_id)
    @trip_vibe.destroy
    render json: {message: "Trip Vibe successfully destroyed."}
  end
end
