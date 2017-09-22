Rails.application.routes.draw do
  
root 'sessions#new'

  get    '/help',    to: 'static_pages#help'
  get    '/comments',    to: 'static_pages#comments'
  get    '/home',   to: 'static_pages#home'
  get    '/admin', to: 'static_pages#admin'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get   '/signup',  to: 'users#new'
  get   '/redcomment', to: 'comments#new'
  post   '/redcomment', to: 'comments#new'
  get   '/showcomment', to: 'comments#show'
  get   '/feedbacks' , to: 'feedbacks#show'

  get '/like' , to: 'comments#commit_like'

  resources :users
  resources :comments
  resources :feedbacks
  #resources :customers
  #resources :users
      #api
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :customers, only: [:index, :create, :show, :update, :destroy]
      resources :feedbacks, only: [:index, :create, :show, :update, :destroy]
      resources :comments, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
