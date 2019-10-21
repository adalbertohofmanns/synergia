Rails.application.routes.draw do
  root to: "application#index"
  
  resources :products, only: [:index]
  resources :available_products, only: [:index, :new, :create, :destroy] do
    member do 
      post :add_quantity
      post :remove_quantity
    end
  end

end
