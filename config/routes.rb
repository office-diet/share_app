Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index] do
    collection do
      get 'search'
    end
    resources :items, only: [:index]
  end

  resources :reviews, only: [:index, :create, :edit, :update, :destroy]
  resources :carts, only: [:index, :create, :destroy, :update]
  resources :sends, only: [:index, :new, :create]
end
