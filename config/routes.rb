Rails.application.routes.draw do

  post 'comments/:id/votes/create', to: 'votes#create'
  get 'posts/:id/comments', to: 'posts#getComments'
  get 'api/v1/users/:id/posts', to: 'api/v1/users#retrieve_user_posts'
  get 'api/v1/users/:id/voted_comments', to: 'api/v1/users#voted_comments'
  get 'api/v1/users/:id/analytics', to: 'api/v1/users#retrieve_user_analytics'

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
