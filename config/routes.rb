Rails.application.routes.draw do
  resources :sites, :only => [:index, :show]
  resources :tags, :except => [:destroy, :update]
  resources :bokmarks, :except => [:update]
  devise_for :users,
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
