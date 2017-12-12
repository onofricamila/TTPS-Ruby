Rails.application.routes.draw do

  resources :courses do
    member do
      get :summary
    end

    resources :exams do
      resources :results
    end

    resources :students
  end

  get 'home/index'

  devise_for :users
  
  root to: "home#index"
  
end
