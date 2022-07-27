Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/register', to: 'users#new'
      post '/register', to: 'users#create'

      get '/favorites/new', to: 'favorites#new'
      post '/favorites/new', to: 'favorites#create'
    end
  end
end
