class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:garden_id])
    @garden_plants = @garden.unique_plants_under_100
    # binding.pry
  end
end
