Rails.application.routes.draw do
  # resources :questions do
  #   resources :answers
  # end
  # resources :users do
  #   get 'set_admin'
  # end
  # resources :visitors

namespace :users do
 resources :user do
  get 'set_admin'
  get 'set_moderator'
  get 'set_tags'
end
end
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations"}

  root to: 'questions#index'
  get 'tags/:tag', to: 'questions#index', as: :tag

  resources :questions do 
    collection do 
      post 'add_answer'
      get 'user_question'
      get 'user_answer'
      post 'update_vote'
      get 'page/:page', action: :index 
      get '/:id/page/:page', action: :show
      get 'search'
    end
  end
  resources :tag
   
  
  resources :answers do
    get 'page/:page', :action => :index, :on => :collection
end
 #match ':controller(/:action(/:id))', :via => [:get, :post]
end
  