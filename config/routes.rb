Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  root to: 'welcomes#index'
  resources :welcomes, only: [ :index ]
  resources :works, only: [ :index, :show ] do
    get :dongp, on: :collection
    get :jiax, on: :collection
    resources :suggestions
  end

  namespace :backend do
    resources :admins
    resources :song_poems
    resources :tang_poems
    resources :qin_poetries
    resources :han_poetries
    resources :articles
  end

  namespace :profile do
    resource :basic
  end

  get 'about', to: 'main#about'
  get 'search', to: 'main#search'
  delete "/users/sign_out" => "users/sessions#destroy"
end
