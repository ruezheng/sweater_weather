Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      resources :users, only: [:create]

      get '/book-search', to: 'books#search'
    end
  end
end
# GET /api/v1/book-search?location=denver,co&quantity=5