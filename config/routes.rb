Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"
  resources :users, only: [:index,:show, :new, :edit, :update,]
  # usersコントローラの中のshowアクションのみへのルート
  resources :books, only: [:new, :index, :create, :edit, :show, :update, :destroy]
  #booksコントローラのアクションに飛ぶルート
end
