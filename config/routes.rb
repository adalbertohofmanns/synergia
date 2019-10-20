Rails.application.routes.draw do
  resources :products
  get '/', to: "products#index"
  get '/products', to: "products#index"
  get '/products/json', to: "products#show"
  
end
