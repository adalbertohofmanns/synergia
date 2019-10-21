require 'rails_helper'

RSpec.describe AvailableProduct, type: :model do
  # validations
  it { is_expected.to validate_presence_of(:color_id) }
  it { is_expected.to validate_presence_of(:size_id) }

  # relations
  it { should belong_to(:product) }
  it { should belong_to(:color) }
  it { should belong_to(:size) }
end