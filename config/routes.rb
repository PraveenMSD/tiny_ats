Rails.application.routes.draw do
  devise_for :users

  resources :jobs


  
  resources :candidates do
    resources :comments
  end    

  post '/candidates/status' => 'candidates#status'

  post '/jobs/priority' => 'jobs#priority'

  root to: 'jobs#index'

end
