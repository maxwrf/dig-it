Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: "pages#dashboard"
  get '/dashboard/edit', to: "pages#dashboard_edit"
  patch '/dashboard/edit', to: "pages#dashboard_update"

  resources :diggers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/diggers/search', to: 'diggers#search'
  resources :diggers do
    resources :bookings
  end
end
