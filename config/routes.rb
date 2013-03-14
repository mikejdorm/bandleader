Bandleader::Application.routes.draw do
 
  resources :posts
  root to: 'static_pages#home' 
  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about' 	
  match '/contact', to: 'static_pages#contact'
  match '/connect', to: 'static_pages#connect' 
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  delete 'songs/:id', :to => 'songs#destroy'
  get 'songs/:id', :to => 'songs#show'
  resources :sessions
  resources :connections
  resources :votes		
  resources :users
  resources :stations
  match 'upload' => 'songs#upload', :as => :upload
  #match "songs#upload", :as => "upload"
  match 'songs#create' => 'songs#upload', :as => :upload
  match 'songs' => 'songs#upload', :as => :upload
  match 'station_next#id' => 'stations#next_song', :as => :next_song
  resources :songs
  get 'connect', to: 'connections#create', as: 'connect'
  get 'disconnect', to: 'connections#destroy', as: 'disconnect'
		
end
