require 'rails_helper'

RSpec.describe Plant, type: :model do
  it { should have_many(:plot_plants) }
end
