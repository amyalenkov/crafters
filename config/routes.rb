Rails.application.routes.draw do

  root 'static_page#index'

  devise_for :crafters, controllers: {confirmations: 'crafters/confirmations',
                                      sessions: 'crafters/sessions'}
  devise_for :users, controllers: {confirmations: 'users/confirmations',
                                   sessions: 'users/sessions'}

  resources :crafters
  resources :users


end
