class PlotPlantsController < ApplicationController
  def destroy
    remove_plant = PlotPlant.find_by(
      plot: params[:plot_id],
      plant: params[:plant_id]
    )
    remove_plant.delete

    redirect_to '/plots'
  end
end
