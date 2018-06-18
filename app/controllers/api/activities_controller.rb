class Api::ActivitiesController < ApplicationController
    def index
      @activities = Activity.all
      render 'index.json.jbuilder'
    end

    def show
      activity_id = params[:id]
      @activity = Activity.find(vibe_id)
      render 'show.json.jbuilder'
    end

    def create
      @activity = Activity.create(
                          name: params[:name]
                          )
      @activity.save
      render 'show.json.jbuilder'
    end

    def update
      activity_id = params[:id]
      @activity = Activity.find(activity_id)

      @activity.name = params[:name] || @activity.name

      if @activity.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @activity.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def destroy
      activity_id = params[:id]
      @activity = Activity.find(activity_id)
      @activity.destroy
      render json: {message: "Activity Successfully Destroyed"}
    end
  end
end
