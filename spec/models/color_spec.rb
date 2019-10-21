require 'rails_helper'

RSpec.describe Color, type: :model do
  # relations
  it { should have_many(:available_products) }
end