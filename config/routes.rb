Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'schedule_appointment' => 'appointments#new'
  post 'schedule_appointment' => 'appointments#create'
  resources :users, :appointments, :diagnoses, :receipts, :test_results
  resources :conversations do
    resources :messages
  end
  resources :holders do
    resources :prescriptions
  end
  resources :containers do
    resources :receipts
  end
  resources :contenedors do 
    resources :test_results
  end
end
