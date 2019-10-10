Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'works#index'
  resources :works, only: [ :index, :show ]

  namespace :backend do
    resources :song_poems
    resources :articles
  end
end
