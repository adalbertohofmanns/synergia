require 'rails_helper'

RSpec.describe AvailableProductsController, type: :controller do
  it { should route(:get, '/available_products').to(action: :index) }

  it do
    params = {
      available_product: {
        color_id: '1',
        size_id: '1',
        product_id: '1',
        quantity: '1'
      }
    }
    should permit(:color_id, :size_id, :product_id, :quantity).
      for(:create, params: params).
      on(:available_product)
  end

  describe 'GET #create' do
    before { get :create }

    it { should redirect_to(available_products_path) }
    it { should redirect_to(action: :index) }
  end

end