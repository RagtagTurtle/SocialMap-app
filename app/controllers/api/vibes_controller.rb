class Api::VibesController < ApplicationController
  def index
    @vibes = Vibe.all
    render 'index.json.jbuilder'
  end

  def show
    vibe_id = params[:id]
    @vibe = Vibe.find(vibe_id)
    render 'show.json.jbuilder'
  end

  def create
    @vibe = Vibe.create(
                        name: params[:name]
                        )
    @vibe.save
    render 'show.json.jbuilder'
  end

  def update
    vibe_id = params[:id]
    @vibe = Vibe.find(vibe_id)

    @vibe.name = params[:name] || @vibe.name

    if @vibe.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @vibe.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    vibe_id = params[:id]
    @vibe = Vibe.find(vibe_id)
    @vibe.destroy
    render json: {message: "Vibe Successfully Destroyed"}
  end
end
