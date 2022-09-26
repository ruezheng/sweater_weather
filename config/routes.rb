Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'

      resources :users, only: [:create]
    end
  end
end
