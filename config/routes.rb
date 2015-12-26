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
      get 'get_crafter_album'
    end
  end

  get '/subcategory/:name' => 'crafters#get_crafters_for_subcategory'
  get '/category/:name' => 'crafters#get_crafters_for_category'

  resources :users do
    member do
      post 'update_avatar'
    end
  end

  resources :conversation do
    post 'add_message'
  end



  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  post '/get_subcategory' => 'application#get_subcategory'
  get '/search' => 'static_page#search'
  post '/search_ajax' => 'static_page#search_ajax'
  post '/search_new_ajax' => 'static_page#search_new_ajax'
  post '/search_ajax_full' => 'static_page#search_ajax_full'
  post '/search_ajax_full' => 'static_page#search_ajax_full'

end
