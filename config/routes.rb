Rails.application.routes.draw do
  root 'home#index'
  resources :jobs, only:[:show,:new,:create,:edit,:update]
  resources :companies, only:[:show,:new,:create]
  resources :categories, only:[:show,:new,:create]
end
