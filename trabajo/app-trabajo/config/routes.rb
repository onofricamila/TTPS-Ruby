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

  devise_for :users
  
  root :to => "courses#index"
  
end
