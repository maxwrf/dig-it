Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: "pages#dashboard"
  get '/dashboard/edit', to: "pages#dashboard_edit"
  patch '/dashboard/edit', to: "pages#dashboard_update"


  get 'diggers/search', to: 'diggers#search'


  resources :diggers do
    resources :bookings
  end
end
