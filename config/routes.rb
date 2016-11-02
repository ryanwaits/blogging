Rails.application.routes.draw do
  get 'log_in' => 'sessions#new', as: 'login'
  get 'log_out' => 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  
  resources :posts do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
end
