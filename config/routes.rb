Blocipedia::Application.routes.draw do
  get "collaborators/index"
  get "collaborators/new"
  devise_for :users
  root :to => "welcome#index"
  resources :wikis do
    resources :collaborations, only: [:index, :new, :create, :destroy]
  end
  get :my_wiki, controller: 'wikis'
  resources :charges, only: [:new, :create]
  resources :users, only: [:index, :show, :udpate, :destroy, :edit]
  resources :sharedwikis

end
