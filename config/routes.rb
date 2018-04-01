Rails.application.routes.draw do
  # post '/build_worker_cards' => 'tasks#build_worker_cards'
  resources :documents do
    member do
      get :download_file
    end
  end
  resources :task_workers
  resources :tasks do
    member do
      get :delegation
      post :delegation
      post :build_worker_cards
    end
  end
  resources :directions
  resources :post_departments
  resources :departments do
  end
  post 'fill_existing_post_form' => 'departments#fill_existing_post_form'
  resources :posts
  resources :workers
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#welcome'
end
