Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: "pages#dashboard"
  get '/dashboard/edit', to: "pages#dashboard_edit"
  patch '/dashboard/edit', to: "pages#dashboard_update"


  get 'diggers/search', to: 'diggers#search'
  get 'diggers/mine', to: 'diggers#mine'

  get 'bookings/mine', to: 'bookings#mine'
  get '/bookings/requests_received', to: 'bookings#received', as: 'bookings_received'
  get 'bookings/:id/approval/:boolean', to: 'bookings#approval'

  resources :diggers do
    resources :bookings
  end

  # resources :conversations, only: [:show, :index, :create] do
  #   resources :messages, only: [:create]
  # end

  resources :channels, only: [:show, :index, :create] do
    resources :letters, only: [:create]
  end

end
