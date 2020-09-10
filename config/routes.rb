Rails.application.routes.draw do

  post 'comments/:id/votes/create', to: 'votes#create'
  get 'posts/:id/comments', to: 'posts#getComments'
  get 'users/:id/posts', to: 'api/v1/users#retrieve_user_posts'
  get 'users/:id/voted_comments', to: 'votes#voted_comments'
  get 'users/:id/analytics', to: 'api/v1/users#retrieve_user_analytics'

  resources :votes
  resources :comments
  resources :posts
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
