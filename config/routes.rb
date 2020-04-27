Rails.application.routes.draw do
  resources :rounds
  resources :sessions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  delete '/users', to: 'users#reset'
end
