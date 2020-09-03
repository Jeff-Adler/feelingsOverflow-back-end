Rails.application.routes.draw do
  resources :comments

  # get '/posts' to 'posts#index'
  # get '/posts/:id' to 'posts#show'
  # post '/posts/:id' to 'posts#create'
  # delete 'posts/:id' to 'posts#destroy'
  # patch'posts/:id' to 'posts#update'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
