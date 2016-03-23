Rails.application.routes.draw do
  root 'welcome#index'
  
  get 'sessions/new'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get     'signup', to: 'users#new'
  resources :users do
    get :profile, on: :member
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  resources :items do
    collection do
      post :confirm
    end
  end
  
  resources :items do
    get :detail, on: :member
  end
  
end
