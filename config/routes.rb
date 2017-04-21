Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :bands
  resources :albums, :tracks, except: [:index]
  resources :notes, only: [:create, :destroy]
  get "activation/:id" => "users#activate"
end
