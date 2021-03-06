Rails.application.routes.draw do
  root 'home#index'

  resources :parking_lots, :except => [:destroy]
  resources :parking_slots, :only => [:new, :create, :index]
  resources :parking_transactions, :only => [:index]

  get 'vehicles/manage', :to => 'vehicles#manage'
  post 'vehicles/park', :to => 'vehicles#park'
  post 'vehicles/unpark', :to => 'vehicles#unpark'
end
