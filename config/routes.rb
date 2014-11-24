Rails.application.routes.draw do

  devise_for :crafters
  devise_for :users
  root 'static_page#index'



end
