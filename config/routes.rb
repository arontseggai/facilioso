Rails.application.routes.draw do
  devise_for :users

  namespace :owner do
    resources :apartments, only: :index
  end
end
