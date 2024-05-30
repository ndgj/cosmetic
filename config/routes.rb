Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about", as: "about"
  resources :post_image, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :index,:update]
end