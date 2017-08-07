Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help' => 'conversations#index'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :conversations do
    resources :messages
  end
end
