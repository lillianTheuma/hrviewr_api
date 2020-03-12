Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  resources :business_processes
  resources :tasks do
    patch '/complete' => 'tasks#completed'
  end
  resources :employees do
    get '/active_tasks' => 'employees#active_tasks'
    get '/get_active_tasks_by_process' => 'employees#get_active_tasks_by_process'
    get '/get_tasks_by_process' => 'employees#get_tasks_by_process'
    get '/get_average_performance_by_process' => 'employees#get_average_performance_by_process'
  end
  resources :departments do
    get '/processes' => 'departments#processes'
  end
  resources :users
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
