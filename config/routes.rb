Blocipedia::Application.routes.draw do
  devise_for :users
  root :to => "welcome#index"
  resources :wikis 
  get :my_wiki, controller: 'wikis'
  resources :charges, only: [:new, :create]
end
