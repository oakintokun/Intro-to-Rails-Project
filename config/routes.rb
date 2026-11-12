Rails.application.routes.draw do
  root "products#index"
  get "/about", to: "pages#about", as: :about
  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]
  get "/brands/map", to: "brands#map", as: :brand_map
  resources :brands, only: [:index, :show]
end
