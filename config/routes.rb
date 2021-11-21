Rails.application.routes.draw do
  devise_for :users
   root to: 'homes#top'
    resources :books
    get 'home/about' => "homes#index"
    resources :users, only: [:show  ,:index ,:edit ,:update]
end
