Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :users, only: :none do 
    resources :books, controller: 'users/books'
  end

  resources :books, only: [:index, :show] do
    member do
      get :download
    end
  end
end
