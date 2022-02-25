Rails.application.routes.draw do
  resources :chats
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'characters#show'
  
  resources :rooms
  resources :monsters
  resources :characters
  resources :ability_tables

  resources :chats do 
    resources :messages
  end
  
  post 'rooms/:id/fight' => 'rooms#fight', as: 'fight'
  post 'ability_tables/:id/add_point' => 'ability_tables#add_point', as: 'add_point'
  
end
