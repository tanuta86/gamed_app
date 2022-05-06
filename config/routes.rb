Rails.application.routes.draw do
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
  

  get  '/played', to: 'informations#played'
  # get  '/console', to: 'static_pages#contact'
  # get  '/contact', to: 'static_pages#contact'
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :self_introductions,  only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  # resources :informations,      　only: [:index]
end


