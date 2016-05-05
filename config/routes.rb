Rails.application.routes.draw do
  root 'welcome#index'
  
  get 'sessions/new'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  get    'forget', to: 'sessions#edit'
  post   'forget', to: 'sessions#update'
  delete 'logout', to: 'sessions#destroy'
  
  get     'signup', to: 'users#new'
  resources :users do
    get :profile, on: :member
    get :favorite
    get :my_item
  end
  
  resources :sessions, only: [:new, :create, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :chats, only: [:create, :destroy]
  match 'searches', to: 'searches#search', via: ['post', 'get']

  
  resources :chats do
    get :index, on: :member
  end
  
  resources :chats do
    get :complete, on: :member
  end
  
  resources :items do
    get :detail, on: :member
  end
  
  resources :items do
    collection do
      post :confirm
    end
  end
  
end
