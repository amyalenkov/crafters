Rails.application.routes.draw do

  root 'static_page#index'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :crafters, controllers: {confirmations: 'crafters/confirmations',
                                      sessions: 'crafters/sessions',
                                      registrations: 'crafters/registrations'}
  devise_for :users, controllers: {confirmations: 'users/confirmations',
                                   sessions: 'users/sessions',
                                   omniauth_callbacks: 'omniauth_callbacks'}

  resources :crafters do
    member do
      post 'update_avatar'
      post 'update_images'
    end
  end
  resources :users do
    post 'update_avatar', on: :member
  end
  # post '/update_avatar' => 'users#update_avatar'
  # post '/update_avatar_crafter' => 'crafters#update_avatar'
  # post '/update_images_crafter' => 'crafters#update_images'

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  post '/get_subcategory' => 'application#get_subcategory'
  get '/search' => 'static_page#search'
  post '/search_ajax' => 'static_page#search_ajax'

end
