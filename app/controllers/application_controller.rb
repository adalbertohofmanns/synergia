class ApplicationController < ActionController::Base
  def index
    redirect_to available_products_path
  end
end
