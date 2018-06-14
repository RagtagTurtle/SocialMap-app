class Api::CitiesController < ApplicationController
  def index
    @cities = City.all
    render 'index.json.jbuilder'
  end

  def show
    city_id = params[:id]
    @city = City.find(city_id)
    render 'show.json.jbuilder'
  end  

  def create
    @city = City.find_or_create_by(
                                  name: params[:name].titleize,
                                  state: params[:state].upcase
                                  )
    @city.assign_attributes(
                            region: params[:region],
                            geography_id: params[:geography_id]
                            )
    @city.save
    render 'show.json.jbuilder'
  end

  def update
    city_id = params[:id]
    @city = City.find(city_id)

    @city.name = params[:name] || @city.name
    @city.state = params[:state] || @city.state
    @city.region = params[:region] || @city.region
    @city.geography_id = params[:geography_id] || @city.geography_id

    if @city.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @city.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    city_id = params[:id]
    @city = City.find(city_id)
    @city_trip.destroy
    render json: {message: "City Successfully Destroyed"}
  end
end
