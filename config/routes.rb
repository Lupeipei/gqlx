Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations', passwords: 'admins/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'works#index'
  resources :works, only: [ :index, :show ]

  namespace :backend do
    resources :admins
    resources :song_poems
    resources :articles
  end

  namespace :profile do
    resource :basic
  end

  get 'about', to: 'main#about'
  delete "/admins/sign_out" => "admins/sessions#destroy"
end
