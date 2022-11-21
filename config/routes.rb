Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: %i[new create]
  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'user_session#new'
  post 'login', to: 'user_session#create'
  delete 'login', to: 'user_session#destroy'
end
