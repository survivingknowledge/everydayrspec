Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts
  resources :users

  get '/login', to: 'sessions#new'
end
