Rails.application.routes.draw do

  resources :offices
  resources :employees
  get 'polite/salute'

  root 'polite#salute'
end
