Rails.application.routes.draw do
  resources :favourites
  resources :users
  resources :cars



  # get 'users/(:id)/cars', to: 'users#cars_uploaded'
end

