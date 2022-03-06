Rails.application.routes.draw do
  root 'home#index'

  resources :parking_lots
  resources :parking_slots

  get 'vehicles/manage', :to => 'vehicles#manage'
  post 'vehicles/park', :to => 'vehicles#park'
  post 'vehicles/unpark', :to => 'vehicles#unpark'
end
