Rails.application.routes.draw do
 
  get 'topics/new'

  get 'sessions/new'

    root 'topics#index'
    get 'pages/help'
    
    resources :users
    resources :topics
    # resources :favorites
    get 'favorites/index'
    post '/favorites', to: 'favorites#create'
    delete '/favorites', to: 'favorites#destroy'
    
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get  'comments/new'
  post '/comments',   to: 'comments#create'
  
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end