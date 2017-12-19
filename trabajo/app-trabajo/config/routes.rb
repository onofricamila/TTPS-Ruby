Rails.application.routes.draw do

  resources :courses, :except => [:show]  do
    member do
      get :summary
    end
    resources :exams, :except => [:show] do
      member do
        get :results
        post :results, to: "exams#change_results"
      end
    end
    resources :students, :except => [:show]
  end

  devise_for :users
  
  root :to => "courses#index"
  
end
