Rails.application.routes.draw do
  root to: 'pages#home'

  #Login
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  #Models
  resources :openings do
    collection do
      get :candidate
    end
  end
  resources :restaurants
  resources :candidates
  resources :candidaturas, only: [:create, :destroy]

  #Institucional
  get 'institucional_candidato', to: 'pages#candidato'
  get 'institucional_restaurante', to: 'pages#restaurante'
  get 'institucional_contato', to: 'pages#contato'

  get 'solver', to: 'pages#solver'
end
