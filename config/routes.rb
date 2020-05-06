Rails.application.routes.draw do
  resources :restaurants
  root to: 'pages#home'
end
