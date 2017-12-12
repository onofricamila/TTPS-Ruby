Rails.application.routes.draw do



  resources :courses do
    resources :exams do
      resources :results
    end

    resources :students
  end

  
  
  get 'home/index'

  devise_for :users
  
  root to: "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
