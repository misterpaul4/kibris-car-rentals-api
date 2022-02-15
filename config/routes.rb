Rails.application.routes.draw do
  resources :users, param: :_username, only: %i[destroy update show index]
  resources :cars
  resources :favourites

  post 'signup', to: 'users#create'

  post 'login', to: 'authentication#login'

  get 'users/(:_username)/cars_uploaded', to: 'users#uploaded_cars'
  get 'users/(:_username)/favourites', to: 'users#favourite_cars'  

  # patch 'cars/(:id)/apply', to: 'cars#apply_to_rent'
end
