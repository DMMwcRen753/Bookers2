Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  resources :books, only: [:create, :show, :index, :edit, :destroy]
  resources :users, only: [:show, :edit, :index]
  get 'home/about' => 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
