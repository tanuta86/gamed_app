Rails.application.routes.draw do
  get 'groups/new'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # get  '/information',  to: 'informations#index'
  # get  '/category',  to: 'informations#category'
  


  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :self_introductions,  only: [:edit, :update, :create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :informations,        only: [:index, :show, :create, :destroy]
  resources :have_informations,   only: [:create, :destroy, :edit]
  resources :groups,              only: [:create, :destroy, :index, :show, :update]
  resources :tags,                only: [:create, :destroy]
  resources :favorites,           only: [:create, :destroy]
  resources :microposts,          only: [:create, :destroy]
end