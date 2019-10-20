class ProductsController < ApplicationController
  
  def index
    @products = AvailableProduct.select(:product_id, :color_id, :size_id, "COUNT(product_id) as prod_count").group(:product_id, :color_id, :size_id).order("prod_count DESC");    
  end

  def new
    @product = Product.new
    @product.available_products.build

    @products = Product.all
    @colors = Color.all
    @sizes = Size.all
  end

  def show
    @products = Product.all.as_json(only: [:id, :name, :description])
    render json: @products
  end

  def create
    product_id = "#{ params[:product][:available_products_attributes]["0"][:product_id] }"
    color_id = "#{ params[:product][:available_products_attributes]["0"][:color_id] }"
    size_id = "#{ params[:product][:available_products_attributes]["0"][:size_id] }"

    if params[:product][:available_products_attributes]["0"][:product_id] == ''
      Product.transaction do
        begin
          @product = Product.create(product_params)
          redirect_to products_path, notice: 'Cadastro realizado com sucesso' and return if @product.valid?
        rescue ActiveRecord::StatementInvalid
          redirect_to products_path, notice: 'Ocorreu algo de errado, tente novamente'
        end
      end
    else
      AvailableProduct.transaction do
        begin
          @available_product = AvailableProduct.create!(product_id: product_id, color_id: color_id, size_id: size_id)
          redirect_to products_path, notice: 'Cadastro realizado com sucesso' and return if @available_product.save
        rescue
          redirect_to products_path, notice: 'Ocorreu algo de errado, tente novamente'
        end
      end
    end
      

  end

  private

  def product_params
    params
    .require(:product)
    .permit(:name, :description,
        available_products_attributes: [
          :product_id,
          :color_id,
          :size_id,
        ]
    )
  end

end
