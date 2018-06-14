class Api::RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
    render 'index.json.jbuilder'
  end

  def show
    recommendation_id = params[:id]
    @recommendation = Recommendation.find(recommendation_id)
    render 'show.json.jbuilder'
  end

  def create
    @recommendation = Recommendation.create(
                                            category: params[:category],
                                            name: params[:name],
                                            trip_id: params[:trip_id],
                                            city_id: params[:city_id]
                                            )
  end

  def update
    recommendation_id = params[:id]
    @reommendation = Recommendation.find(recommendation_id)

    @recommendation.category = params[:category] || @recommendation.category
    @recommendation.name = params[:name] || @recommendation.name
    @recommendation.trip_id = params[:trip_id] || @recommendation.trip_id
    @recommendation.city_id = params[:city_id] || @recommendation.city_id

    if @recommendation.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @recommendation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    recommendation_id = params[:id]
    @recommendation = Recommendation.find(recommendation_id)
    @recommendation.destroy
    render json: {message: "Recommendation successfully deleted"}
  end
end
