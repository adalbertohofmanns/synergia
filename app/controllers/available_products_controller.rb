class AvailableProductsController < ApplicationController

  def index
    @available_products = AvailableProduct.all
  end

  def create
    AvailableProduct.transaction do
      begin
        if available_product_params[:product_id].blank?
          product = Product.create!(product_params)
          AvailableProduct.create!(available_product_params.merge(product_id: product.id))
        else
          AvailableProduct.find_or_initialize_by(
            product_id: available_product_params[:product_id],
            color_id: available_product_params[:color_id],
            size_id: available_product_params[:size_id]).tap do |available_product|
            available_product.quantity = available_product.quantity + available_product_params[:quantity].to_i
            available_product.save!
          end
        end

        redirect_to available_products_path, notice: 'Cadastro realizado com sucesso'
      rescue
        redirect_to available_products_path, notice: 'Ocorreu algo de errado, tente novamente'
      end
    end
  end

  def new
    @available_product = AvailableProduct.new
    @available_product.build_product

    @colors = Color.all
    @sizes = Size.all
  end

  def add_quantity
    available_product = AvailableProduct.find(params[:id])
    available_product.update_attributes!(quantity: available_product.quantity + 1)
    render json: {}
  end

  def remove_quantity
    available_product = AvailableProduct.find(params[:id])
    available_product.update_attributes!(quantity: available_product.quantity - 1)
    render json: {}
  end

  private

  def available_product_params
    params
      .require(:available_product)
      .permit(:color_id, :size_id, :product_id, :quantity)
  end

  def product_params
    params
      .require(:available_product)
      .require(:product_attributes)
      .permit(:name, :description)
  end

end