Rails.application.routes.draw do
  resources :products
  get '/', to: "products#index"
  get '/produtos', to: "products#index"
  
end
