Blocipedia::Application.routes.draw do
  get "public_wikis/show"
  devise_for :users
  root :to => "welcome#index"
  resources :wikis
  resources :charges, only: [:new, :create]
end
