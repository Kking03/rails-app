Rails.application.routes.draw do
  get 'leaderboard/show'
  get 'leaderboard/update'

  get 'clicker/preview'
  # root 'clicker#preview'
  post 'clicker/click'
  root "sessions#new"
  resource :session, only: %i[new create destroy] 
  resources :users, only: %i[new create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
