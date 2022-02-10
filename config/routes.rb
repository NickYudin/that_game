Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'rooms#index'
  resources :rooms
  resources :monsters
  resources :characters
  resources :ability_tables
  post 'rooms/:id/fight' => 'rooms#fight', as: 'fight'
  post 'ability_tables/:id/add_point' => 'ability_tables#add_point', as: 'add_point'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
