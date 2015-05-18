Conductor::Application.routes.draw do
  namespace :admin do
    root 'base#index'

    resources :projects, only: [:new, :create, :destroy]
    resources :users
    resources :states, only: [:index, :new, :create]
  end

  devise_for :users
  root 'projects#index'

  resources :projects, only: [:index, :show, :edit, :update] do
    resources :tickets
  end

  resources :tickets, only: [] do
    resources :comments, only: [:create]
  end

  resources :assets, only: [:show, :new], path: :files
end
