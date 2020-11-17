Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :rider_users, ActiveAdmin::Devise.config.merge({path: '/rider'})
  ActiveAdmin.routes(self)
  devise_for :users
  resources :dashboard, only: [:index]
  resources :restaurants, only: [ :index, :show] do
    member do
      get 'status'
    end
  end
  root to: 'pages#home'
  get 'error', to: 'pages#error'
  get 'faqs', to: 'pages#faqs'
  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'
  match '/contacts', to: 'contacts#new', via: 'get'
  resources :contacts, only: [:new, :create] 
  resources :menu_items, only: [ :show ] do
    resources :order_items, only: [ :create ]
  end
  resources :order_items, only: [ :destroy]
  resources :orders, only: [:index, :create, :destroy] do
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  require "sidekiq/web"
  authenticate :admin_user do
    mount Sidekiq::Web, at: '/admin/sidekiq'
  end
end