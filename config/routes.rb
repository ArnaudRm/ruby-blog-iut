Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :users

  authenticate :user do
    resources :posts, only: [:new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end
  resources :posts, only: [:index, :show]


end
