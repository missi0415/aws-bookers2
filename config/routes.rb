Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :users, only: [:show]
  # usersコントローラの中のshowアクションのみへのルート
  resources :books, only: [:new, :index, :create, :show, :destroy]
  #booksコントローラのアクションに飛ぶルート
end
