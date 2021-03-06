Rails.application.routes.draw do
  root   'hotels#top'
  get    'signup' => 'users#new'
  post   'signup' => 'users#create'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users, only: [:show]
  resources :hotels do
    resources :comments
  end
end
