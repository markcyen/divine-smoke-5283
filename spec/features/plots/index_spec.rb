require 'rails_helper'

RSpec.describe 'Plots', type: :feature do
  describe 'index page' do
    before(:each) do
      @garden_1 = Garden.create!(name: 'Garden of Eden', organic: 'true')
      # @garden_2 = Garden.create!(name: 'My Garden', organic: 'false')

      @plot_1 = @garden_1.plots.create!(number: 30, size: 'Large', direction: 'East')
      @plot_2 = @garden_1.plots.create!(number: 10, size: 'Small', direction: 'South')
      @plot_3 = @garden_1.plots.create!(number: 20, size: 'Medium', direction: 'West')

      @plant_1 = Plant.create!(name: 'Carrots', description: 'Prefers medium sunlight and lots of water', days_to_harvest: 90)
      @plant_2 = Plant.create!(name: 'Purple Sweet Potatoes', description: 'Prefers low sunlight and plenty of water', days_to_harvest: 103)
      @plant_3 = Plant.create!(name: 'Watermelon', description: 'Prefers a lot of sunlight and tots of water', days_to_harvest: 99)

      @plant_4 = Plant.create!(name: 'Peas', description: 'Likes to be around other plants', days_to_harvest: 67)
      @plant_5 = Plant.create!(name: 'Cucumbers', description: 'Needs adequate amount of sunlight and water', days_to_harvest: 100)
      @plant_6 = Plant.create!(name: 'Yellow Bell Peppers', description: 'Water enough per day', days_to_harvest: 78)

      PlotPlant.create!(plot: @plot_1, plant: @plant_1)
      PlotPlant.create!(plot: @plot_1, plant: @plant_2)
      PlotPlant.create!(plot: @plot_1, plant: @plant_3)

      PlotPlant.create!(plot: @plot_2, plant: @plant_4)
      PlotPlant.create!(plot: @plot_2, plant: @plant_5)
      PlotPlant.create!(plot: @plot_2, plant: @plant_6)

      PlotPlant.create!(plot: @plot_3, plant: @plant_1)
      PlotPlant.create!(plot: @plot_3, plant: @plant_3)
      PlotPlant.create!(plot: @plot_3, plant: @plant_5)

      # @plot_4 = @garden_2.plots.create!(number: 15, size: 'Large', direction: 'North')
      # @plot_5 = @garden_2.plots.create!(number: 5, size: 'Small', direction: 'East')
      # @plot_6 = @garden_2.plots.create!(number: 10, size: 'Medium', direction: 'South')
      #
      # @plot_4.plants << @plant_2
      # @plot_4.plants << @plant_4
      # @plot_4.plants << @plant_6
    end

    it 'lists out all plot numbers' do
      visit '/plots'

      ['Plot 30', 'Plot 10', 'Plot 20'].each do |plot_number|
        expect(page).to have_content(plot_number)
      end
    end

    it 'displays plant names under each plot' do
      visit '/plots'
save_and_open_page
      within("#plot-#{@plot_1.id}") do
        ['Carrots', 'Purple Sweet Potatoes', 'Watermelon'].each do |plant|
          expect(page).to have_content(plant)
        end
      end

      within("#plot-#{@plot_2.id}") do
        ['Peas', 'Cucumbers', 'Yellow Bell Peppers'].each do |plant|
          expect(page).to have_content(plant)
        end
      end

      within("#plot-#{@plot_3.id}") do
        ['Carrots', 'Watermelon', 'Cucumbers'].each do |plant|
          expect(page).to have_content(plant)
        end
      end
    end
  end
end
