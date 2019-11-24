Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  root to: 'welcomes#index'

  namespace :backend do
    resources :users
    resources :song_poems
    resources :tang_poems
    resources :qin_poetries
    resources :han_poetries
    resources :articles
  end

  namespace :profile do
    resource :basic
  end

  resources :qin_poetries, :song_poems, :tang_poems, :han_poetries, :articles, :dongps, :jiaxs do
    collection do
      get :poetries
      get :yuefus
      get :cis
      get :essays
    end
  end

  resources :welcomes, only: [ :index ]
  resources :works, only: [:show ] do
    resources :suggestions
    resource :flip
  end

  get 'about', to: 'main#about'
  get 'search', to: 'main#search'
  delete "/users/sign_out" => "users/sessions#destroy"
end
