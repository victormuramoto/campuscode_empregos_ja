Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :jobs, only:[:show,:new,:create,:edit,:update]
  resources :companies, only:[:show,:new,:create,:edit,:update]
  resources :categories, only:[:show,:new,:create]
  resources :contracts, only:[:show,:new,:create]
  resources :dashboards, only:[:index]

  namespace :api, defaults:{format: :json} do
    resources :jobs, only:[:show,:index]
    resources :companies, only: [:show] do
      member do
        get 'jobs'
      end
    end
    resources :categories, only: [:show]
  end

end
