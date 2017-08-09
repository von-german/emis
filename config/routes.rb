Rails.application.routes.draw do
  resources :doctors
  resources :nurses
  resources :receptionists
  root 'sessions#new'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'receptionist/new' => 'receptionist#new'
  post 'receptionist/new' => 'receptionist#create'
  resources :users
  resources :conversations do
    resources :messages
  end
end
