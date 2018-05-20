Rails.application.routes.draw do
  root to: 'pages#home'

  #Login
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  #Models
  resources :openings
  resources :restaurants
  resources :candidates
  resources :applications, only: [:create, :destroy]

  #Institucional
  get 'institucional_candidato', to: 'pages#candidato'
  get 'institucional_restaurante', to: 'pages#restaurante'
  get 'institucional_contato', to: 'pages#contato'

end
