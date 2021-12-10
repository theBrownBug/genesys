# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_roles
  resources :roles
  devise_for :users
  resources :users
  resources :registers
  resources :reviews, only: %i[index create update]

  resources :questions do
    resources :answers
  end

  match '/403', to: 'errors#error_403', via: :all
  match '/404', to: 'errors#error_404', via: :all
  match '/422', to: 'errors#error_422', via: :all
  match '/500', to: 'errors#error_500', via: :all

  get :ie_warning, to: 'errors#ie_warning'

  get '*path' => redirect('/')

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
