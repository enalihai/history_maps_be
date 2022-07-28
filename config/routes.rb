Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/'

  namespace :api do
    namespace :v1 do
      
      resources :users, only: [:index, :show] do
        resources :favorites, only: [:index, :show, :new, :create]
      end
      # get '/users', to: 'users#index'
      get '/users/register', to: 'users#new'
      post '/users/register', to: 'users#create'
      # get '/users/:id', to:'users#show'
      # namespace :users do
      #   # resources :register, only: [:new, :create], controller: :users
      # end

      # get '/favorites/new', to: 'favorites#new'
      # post '/favorites/new', to: 'favorites#create'

      get '/search', to: 'location_search#show'
    end
  end
end
