require 'rails_helper'

RSpec.describe Product, type: :model do
  # validations
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }

  # relations
  it { should have_many(:available_products) }
end