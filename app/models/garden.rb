class Garden < ApplicationRecord
  has_many :plots
  has_many :plot_plants, through: :plots
  has_many :plants, through: :plot_plants

  def unique_plants_under_100
    plants
      .where('days_to_harvest < ?', 100)
      .distinct
      .pluck(:name, :description)

    # plants
    #   .select('plants.*, count(plants)') # AS plants_count')
    #   .where('days_to_harvest < ?', 100)
    #   .group('plants.id')
    #   .order('count DESC')
    #   .distinct
    #   .pluck(:name, :description)
  end
end
