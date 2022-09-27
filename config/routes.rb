Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/book-search', to: 'books#search'
      
      resources :forecast, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :road_trip, only: [:create]
    end
  end
end
