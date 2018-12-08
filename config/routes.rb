Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :problems
      resources :services
      resources :collections do
        resources :links
      end
      get 'thumbs', to: 'tumbs#show'
      get 'collection/:url', to: 'public_collections#show'
      # put 'profile/password', to: 'passwords#change'
      devise_scope :user do
        post 'sign_in', to: 'sessions#create'
        post '/sign_up', to: 'registrations#create'
        delete '/sign_out', to: 'sessions#destroy'
        put 'profile/password', to: 'passwords#change'
      end
    end
  end
end
