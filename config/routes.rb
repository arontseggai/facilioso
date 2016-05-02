Rails.application.routes.draw do
  devise_for :users

  namespace :owner do
    resource :dashboard, only: :show
    resources :apartments, only: [:index, :show, :new, :create, :update, :destroy]
  end
end
