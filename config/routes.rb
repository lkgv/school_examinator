Rails.application.routes.draw do
  resources :exam_items do
    resources :std_activities
  end
  resources :class_orgs
  get 'class_orgs/:id/new_activity', to: 'class_orgs#new_activity', as: :new_class_org_activity
  post 'class_orgs/:id/create_activity', to: 'class_orgs#create_activity', as: :create_class_org_activity

  resources :activities
=begin
  get 'activities/new', to: 'activities#new'
  get 'activities', to: 'activities#index'
  post 'activities', to: 'activities#create'
  get 'activities/:id', to: 'activities#show'
  delete 'activities/:id' # , as: 'destroy_activity'
=end

  resources :user_management

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    omni_auth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks',
  }

  get 'home/index'
  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
