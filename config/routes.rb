Rails.application.routes.draw do
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root 'home#index'

  get '/', to: 'home#index'

  resources :movies do
    resources :feedbacks, only: [:create, :update, :destroy], shallow: true
  end

  post '/like', to: 'like#index'
end
