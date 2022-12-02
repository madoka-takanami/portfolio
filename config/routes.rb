Rails.application.routes.draw do
  get 'others_restaurants/index'
  root to: 'users#index'

  resources :users, only: %i[new create index show] do
    get :followings, :followed, on: :member
    resources :relationships, only: %i[create destroy]
  end

  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'user_session#new'
  post 'login', to: 'user_session#create'
  delete 'login', to: 'user_session#destroy'
end
