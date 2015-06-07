Rails.application.routes.draw do
  root 'static_pages#index'

  get 'login', to: 'sessions#new'
  post 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :users do
    member do
      get 'password'
    end
  end

  resources :sessions
  resources :customers
  resources :products
  resources :proposals
  resources :suppliers
end
