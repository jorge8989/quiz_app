Rails.application.routes.draw do
  
 
  root 'quizzes#index'
  
  
  resources :questions do
    resources :quiz_options, only: [:new, :create]
  end
  resources :quiz_options, except: [:new, :create]
  
  resources :quizzes do
    resources :personalities, only: [:new, :create]
    resources :questions, only: [:new, :create]
  end
  resources :personalities, except: [:new, :create]
  resources :questions, except: [:new, :create]
  
  get '/take_test/:id', to: 'user_quizzes#take_quiz', as: 'take_test'

end
