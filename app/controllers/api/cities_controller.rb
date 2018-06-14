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
end
