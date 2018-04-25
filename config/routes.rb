Rails.application.routes.draw do
  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects
  resources :tickets
  resources :tags
end