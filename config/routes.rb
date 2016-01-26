Rails.application.routes.draw do
  

  root 'dashboards#index'
  devise_for :users
  
  resources :questions do
    resources :quiz_options, only: [:new, :create]
  end
  resources :quiz_options, except: [:new, :create, :index]
  
  resources :quizzes do
    resources :personalities, only: [:new, :create]
    resources :questions, only: [:new, :create, :index]
    collection do 
      get 'results', as: 'results'
    end
  end
  resources :personalities, except: [:new, :create]
  resources :questions, except: [:new, :create, :index]
  resources :user_results, except: [:index]
  
  get '/take_quiz/:id', to: 'user_quizzes#take_quiz', as: 'take_quiz'
  get '/admin', to: 'quizzes#index', as: 'admin'

end
