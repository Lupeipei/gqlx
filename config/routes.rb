Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'works#index'
  resources :works, only: [ :index, :show ]

  namespace :backend do
    resources :admins
    resources :song_poems
    resources :articles
  end

  get 'about', to: 'main#about'
end
