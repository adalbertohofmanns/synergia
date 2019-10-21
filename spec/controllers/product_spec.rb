require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { should respond_with(200) }
  end
end