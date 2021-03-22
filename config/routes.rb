Rails.application.routes.draw do
  devise_for :users

  resources :jobs


  
  resources :candidates do
    resources :comments
  end    


  root to: 'jobs#index'

end
