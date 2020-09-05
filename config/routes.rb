Rails.application.routes.draw do

  get 'posts/:id/comments', to: 'posts#getComments'

  resources :comments
  resources :posts
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
