Rails.application.routes.draw do
  devise_for :users

  resources :jobs


  
  resources :candidates do
    resources :comments
  end    

  post '/candidates/status' => 'candidates#status'

  post '/jobs/priority' => 'jobs#priority'

  post '/candidates/job_title' => 'candidates#job_title'

  post '/candidates/get_candidates' => 'candidates#get_candidates'

  root to: 'jobs#index'

end
