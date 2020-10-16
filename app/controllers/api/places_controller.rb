class Api::PlacesController < ApplicationController
  def index
    @places = Place.all
    render "index.json.jb"
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if @place.save
      render "show.json.jb", status: 201
    else
      render json: {errors: @place.errors.full_messages}
    end
  end

  def show
    @place = Place.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @place = place.find(params[:id])

    @place.name = params[:name] || @place.name
    @place.price = params[:address] || @place.address

    if @place.save
      render 'show.json.jb'
    else
      render json: {errors: @place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: {message: "Successfully Removed Place"}
  end
end
