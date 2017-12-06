Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sessions
      resources :users
      resources :boardgames

      get '/users/:id/createboardgame' => 'users#createBoardgame'
      post '/users/:id/createboardgame' => 'users#createBoardgame'
      post '/auth' => 'sessions#create'
      get '/current_user' => 'sessions#show'

      get '/users/new' => 'users#new'
      post '/users/create' => 'users#createUser'

      get '/addtocollection' => 'users#addToCollection'
      post '/addtocollection' => 'users#addToCollection'

      post '/addOrRemoveFriend' => 'users#addOrRemoveFriend'

      get '/removefromcollection' => 'users#removeFromCollection'
      post '/removefromcollection' => 'users#removeFromCollection'

      get '/updateattribute' => 'users#updateAttribute'
      post '/updateattribute' => 'users#updateAttribute'

      get '/users/update' => 'users#update'
      post '/users/update' => 'users#update'

    end
  end
end
