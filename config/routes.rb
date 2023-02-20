Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    resources :dashboards, only: %i[admin_index user_index]
    get '/admin/dashboard', to: 'dashboards#admin_index'
    get '/user/dashboard', to: 'dashboards#user_index'
    resources :questions do
      resources :answers, only: %i[new create show] do
        resources :tasks, only: %i[index new update] do
          # post :save_task, on: :collection
        end
      end
    end
  end
  devise_for :users

  # , controllers: {
  #   sessions: 'users/sessions',
  #   registration: 'users/registrations'
  # }

  resources :tasks, only: %i[create destroy]
  root to: "pages#home"
end
