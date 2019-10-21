class ProductsController < ApplicationController
  
  def index
    render json: Product.all.as_json(only: [:id, :name, :description])
  end

end
