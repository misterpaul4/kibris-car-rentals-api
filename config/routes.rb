Rails.application.routes.draw do
  resources :waiting_lists, only: %i[create destroy index]
  resources :users, param: :_username, only: %i[destroy update show index]
  resources :cars
  resources :favourites

  post 'signup', to: 'users#create'

  post 'login', to: 'authentication#login'

  get 'users/(:_username)/cars_uploaded', to: 'users#uploaded_cars'
  get 'users/(:_username)/favourites', to: 'users#favourite_cars'  
end
