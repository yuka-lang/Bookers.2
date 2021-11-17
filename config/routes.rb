Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
   root to: 'homes#top'
    resources :books, only: [:new, :create, :index, :show, :destroy]
    get 'home/about' => "homes#index"
    resources :users, only: [:show ,:index]
end
