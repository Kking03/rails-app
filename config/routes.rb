Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do 
    get 'leaderboard/show'
    get 'leaderboard/update'

    get 'clicker/preview'

    post 'clicker/click'
    root "sessions#new"
    resource :session, only: %i[new create destroy] 
    resources :users, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
