Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'rooms#index'
  resources :rooms
  resources :monsters
  resources :characters
  post 'rooms/:id/fight' => 'rooms#fight', as: 'fight'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
