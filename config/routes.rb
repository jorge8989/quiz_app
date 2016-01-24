Rails.application.routes.draw do
  
 
  root 'dashboards#index'
  
  
  resources :questions do
    resources :quiz_options, only: [:new, :create]
  end
  resources :quiz_options, except: [:new, :create, :index]
  
  resources :quizzes do
    resources :personalities, only: [:new, :create]
    resources :questions, only: [:new, :create, :index]
  end
  resources :personalities, except: [:new, :create]
  resources :questions, except: [:new, :create, :index]
  
  get '/take_quiz/:id', to: 'user_quizzes#take_quiz', as: 'take_quiz'
  get '/admin', to: 'quizzes#index', as: 'admin'

end
