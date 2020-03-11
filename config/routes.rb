Rails.application.routes.draw do
  resources :business_processes
  resources :tasks
  resources :employees do
    get '/active_tasks' => 'employees#active_tasks'
  end
  resources :departments
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
