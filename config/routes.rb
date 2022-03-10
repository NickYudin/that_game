Rails.application.routes.draw do
  resources :chats
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'monsters#index'

  resources :rooms
  resources :monsters
  resources :characters
  resources :characters do
    get :edit_name
  end
  resources :ability_tables
  resources :weapons

  resources :chats do
    resources :messages
  end
  # buttons in fight:
  post 'rooms/:id/fight' => 'rooms#fight', as: 'fight'
  post 'rooms/:id/strike' => 'rooms#strike', as: 'strike'
  post 'rooms/:id/run' => 'rooms#run', as: 'run'
  # button to increase skills:
  post 'ability_tables/:id/add_point' => 'ability_tables#add_point', as: 'add_point'
end
