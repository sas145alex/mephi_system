Rails.application.routes.draw do
  resources :documents do
    member do
      get :download_file
    end
  end
  resources :task_workers
  resources :tasks
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
