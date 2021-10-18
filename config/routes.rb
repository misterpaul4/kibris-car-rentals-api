Rails.application.routes.draw do
  resources :users
  resources :cars
  resources :favourites

  get 'users/(:id)/cars_uploaded', to: 'users#uploaded_cars'
  get 'users/(:id)/favourites', to: 'users#favourite_cars'

end

