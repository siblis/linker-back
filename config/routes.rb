Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :problems
      resources :services
      resources :collections, param: :url do
        resources :links
      end
      devise_scope :user do
        post '/sign_in', to: 'sessions#create'
        post '/sign_up', to: 'registrations#create'
        delete '/sign_out', to: 'sessions#destroy'
      end
    end
  end
end
