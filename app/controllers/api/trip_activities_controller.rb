class Api::TripActivitiesController < ApplicationController
  def index
    @trip_activities = TripActivity.all
    render 'index.json.jbuilder'
  end

  def show
    trip_activity_id = params[:id]
    @trip_activity = TripActivity.find(trip_activity_id)
    render 'show.json.jbuilder'
  end

  def create
    @trip_activity = TripActivity.new(
                              trip_id: params[:trip_id],
                              activity_id: params[:activity_id]
                              )
    @trip_activity.save
    render 'show.json.jbuilder'
  end

  def update
    trip_activity_id = params[:id]
    @trip_activity = TripActivity.find(trip_activity_id)

    @trip_activity.trip_id = params[:trip_id] || @trip_activity.trip_id
    @trip_activity.activity_id = params[:activity_id] || @trip_activity.activity_id

    if @trip_activity.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @trip_activity.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    trip_activity_id = params[:id]
    @trip_activity = TripVibe.find(trip_activity_id)
    @trip_activity.destroy
    render json: {message: "Trip Activity successfully destroyed."}
  end
end
