require 'rails_helper'

RSpec.describe PlotPlant, type: :model do
  it { should belong_to(:plot) }
  it { should belong_to(:plant) }
end
