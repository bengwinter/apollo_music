ApolloApp::Application.routes.draw do

  root 'users#index'
  get 'auth_user' => 'users#auth'
  post 'create_user' => 'users#create'
  resources :users
  get 'destroy_session' => 'sessions#destroy', as: :destory_session

end
