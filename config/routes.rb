Rails.application.routes.draw do
  resources :waiting_lists, only: %i[create destroy index]
  resources :users, param: :_username, only: %i[destroy update show index]
  resources :cars
  resources :favourites, only: %i[index create]

  post 'signup', to: 'users#create'

  post 'login', to: 'authentication#login'

  get 'favourited/cars/(:id)', to: 'cars#favourited?'

  get 'users/(:_username)/cars_uploaded', to: 'users#uploaded_cars'
  get 'users/(:_username)/favourites', to: 'users#favourite_cars'

  get 'cars_favs/(:_username)', to: 'users#cars_favs'

  get 'cars/(:id)/is_waiting', to: 'cars#check_waiting_list'

  get 'cars/(:id)/waiting_list', to: 'cars#get_waiting_list'

  delete 'favourites/', to: 'favourites#destroy'
end
