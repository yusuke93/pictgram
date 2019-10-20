Rails.application.routes.draw do
 
  get 'topics/new'

  get 'sessions/new'

    root 'pages#index'
    get 'pages/help'
    
    resources :users
    resources :topics
    
    get 'favorites/index'
    post '/favorites', to: 'favorites#create'
    
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get  'comments/new'
  post '/comments',   to: 'comments#create'
  
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end