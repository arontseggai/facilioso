Rails.application.routes.draw do
  devise_for :users

  namespace :owner do
    resource :dashboard, only: :show
    resources :apartments, only: [:index, :show, :new, :create, :update, :destroy]
  end

  namespace :manager do
    resource :dashboard, only: :show
    resources :bookings, only: [:new, :create]
    resources :apartments, only: [:index, :show, :update] do
      resources :bookings
      resources :invoices
    end
  end
end
