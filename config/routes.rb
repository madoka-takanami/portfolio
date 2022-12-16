Rails.application.routes.draw do

  root to: 'users#index'

  resources :users, only: %i[new create index show] do
    resources :relationships, only: %i[create destroy]
  end

  resources :restaurants do
    resource :visits, only: %i[create destroy]
  end
  resources :others_restaurants, only: %i[index show]
  resources :spots, only: %i[new index create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[create edit update new]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'user_session#new'
  post 'login', to: 'user_session#create'
  delete 'login', to: 'user_session#destroy'
end
