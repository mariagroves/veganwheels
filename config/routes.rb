Rails.application.routes.draw do
  resources :restaurants do
    resources :menu_items, only: [ :new, :create ]
  end
  root to: 'pages#home'
  resources :menu_items, only: [ :edit, :update, :destroy ] do
    resources :menu_options, only: [ :new, :create ]
    resources :order_items, only: [ :new, :create ]
  end
  resources :menu_options, only: [ :edit, :update, :destroy ]
end
