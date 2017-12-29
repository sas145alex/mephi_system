Rails.application.routes.draw do
  resources :post_departments
  resources :departments
  resources :posts
  resources :workers
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#welcome'
end
