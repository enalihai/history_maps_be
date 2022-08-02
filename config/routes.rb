Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :favorites, only: [:index, :show, :new, :create]
      end
      get '/users/register', to: 'users#new'
      post '/users/register', to: 'users#create'

      get '/search', to: 'location_search#show'

      get '/results', to: 'results#index'
      get '/results/:id', to: 'results#show'

      get '/images', to: 'images#show'
    end
  end
end
