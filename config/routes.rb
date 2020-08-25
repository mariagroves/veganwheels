Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
    resources :menu_items, only: [ :new, :create ]
  end
  root to: 'pages#home'
  resources :menu_items, only: [ :edit, :update, :destroy, :show ] do
    resources :menu_options, only: [ :new, :create ]
    resources :order_items, only: [ :new, :create ]
  end
  resources :menu_options, only: [ :edit, :update, :destroy ]
  resources :order_items, only: [ :destroy]
end
