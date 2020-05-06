Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  namespace :admin do
    root to: "home#index"
    resources :jobs, only: [:index, :new, :create, :edit, :update]
    resources :companies, only: [:index, :new, :create, :edit, :update]
    resources :skills, only: [:index, :new, :create, :edit, :update]
    resources :users, only: [:index, :show]
  end
  resources :jobs, only: [:index, :show]
  resources :entries, only: [:create]
  resources :favorites, only: [:create]
  resource :mypage, only: [:show]
end