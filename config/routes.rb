Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/diggers/search', to: 'diggers#search'

  resources :diggers do
    resources :bookings
  end

  get 'bookings/requests_made', to: 'bookings#made'
end
