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

  get 'top', to: 'top#index'
  get 'login', to: 'user_session#new'
  post 'login', to: 'user_session#create'
  delete 'login', to: 'user_session#destroy'

  get 'terms_of_service', to: 'regulation_pages#terms_of_service'
  get 'privacy_policy', to: 'regulation_pages#privacy_policy'

end
