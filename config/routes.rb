Rails.application.routes.draw do
  devise_for :users,
             :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :routes, only: :create
  # get 'users/auth/spotify/callback', to: 'callbacks#spotify'

  # resources :playlists, only: [:create, :index, :show] do
  #   resources :tracks, only: :create
  # end
  resources :tracks, only: [:create]
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end