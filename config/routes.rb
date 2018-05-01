Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :openings
  resources :restaurants
  resources :candidates
  root to: 'pages#home'

  #Institucional
  get 'institucional_candidato', to: 'pages#candidato'
  get 'institucional_restaurante', to: 'pages#restaurante'
  get 'institucional_contato', to: 'pages#contato'



end
