ApolloApp::Application.routes.draw do

  root 'users#index'
  get 'auth_user' => 'users#auth'
  post 'create_user' => 'users#create'
  resources :users
  get 'destroy_session' => 'sessions#destroy', as: :destory_session
  post 'create_playlist' => 'playlists#create'
  get 'single_playlist_fetch' => 'playlists#single_fetch'
  post 'add_song' => 'songs#create'
  post 'remove_song' => 'songs#remove'
end
