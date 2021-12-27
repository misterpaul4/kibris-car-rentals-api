Rails.application.routes.draw do
  resources :users, param: :_username, only: %i[index destroy update]
  resources :cars
  resources :favourites

  post 'signup', to: 'users#create'

  post 'login', to: 'authentication#login'

  get 'users/(:id)/cars_uploaded', to: 'users#uploaded_cars'
  get 'users/(:id)/favourites', to: 'users#favourite_cars'  
end
