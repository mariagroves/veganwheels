Rails.application.routes.draw do
  get 'pages/home'
  resources :restaurants
  root to: 'pages#home'
end
