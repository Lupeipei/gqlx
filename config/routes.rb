Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations', passwords: 'admins/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcomes#index'
  resources :welcomes, only: [ :index ]
  resources :works, only: [ :index, :show ] do
    get :dongp, on: :collection
    get :jiax, on: :collection
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
  delete "/admins/sign_out" => "admins/sessions#destroy"
end
