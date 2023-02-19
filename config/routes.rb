Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: %i[new create show] do
      resources :tasks, only: %i[index new update]
    end
  end
  resources :tasks, only: %i[destroy]

  devise_for :users
  resources :dashboards, only: [:index]

  get '/admin/dashboard', to: 'dashboards#admin_index'
  get '/user/dashboard', to: 'dashboards#user_index'

  root to: "pages#home"


end
