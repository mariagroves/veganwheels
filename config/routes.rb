Rails.application.routes.draw do
  resources :restaurants do
    resources :menu_items
  end
  root to: 'pages#home'
end
