class ProductsController < ApplicationController
  
  def index
    # @products = AvailableProduct.includes(:product, :color, :size)

    # @products = AvailableProduct.group(:product, :color, :size)
    #     .select(:product, :color, :size, "SUM(prod_count) as prod_count")
    #     .order("prod_count DESC")
    #     .collect{ |location| [available_products.product, available_products.color, available_products.size, available_products.prod_count] }
    
    @products = AvailableProduct.select(:product_id, :color_id, :size_id, "COUNT(product_id) as prod_count").group(:product_id, :color_id, :size_id).order("prod_count DESC");
    
    # @products = AvailableProduct.select('available_products.*, COUNT(product_id, color_id, size_id) as product_count').group('product_id').order('product_count DESC')
  end

  def new
    @product = Product.new
    @product.available_products.build

    @colors = Color.all
    @sizes = Size.all
  end

  def create
    Product.transaction do
      begin
        @product = Product.create(product_params)
        redirect_to produtos_path, notice: 'Cadastro realizado com sucesso' and return if @product.save
      rescue ActiveRecord::StatementInvalid
        render :json => { message: 'Ocorreu algo de errado, tente novamente', success: false } 
      end
    end
  end

  private

  def product_params
    params
    .require(:product)
    .permit(:name, :description,
        available_products_attributes: [
          :id,
          :product_id,
          :color_id,
          :size_id,
        ]
    )
  end

end
