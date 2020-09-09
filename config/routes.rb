Rails.application.routes.draw do

  get 'posts/:id/comments', to: 'posts#getComments'
  get 'users/:id/posts', to: 'posts#my_posts'


  resources :comments
  resources :posts
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
