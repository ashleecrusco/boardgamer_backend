Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sessions
      resources :users
      resources :boardgames

      get '/users/:id/createboardgame' => 'users#createBoardgame'
      post '/users/:id/createboardgame' => 'users#createBoardgame'
      post '/auth', to: 'sessions#create'
      get '/current_user', to: 'sessions#show'
    end
  end
end
