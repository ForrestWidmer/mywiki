Mywiki::Application.routes.draw do
  
  get "account/index"

  get "discussions/create"

  get "categories/wikis/collaborators", to: "collaborators#index"


  devise_for :users

  resources :charges

  resources :webhooks

  resources :categories do
    resources :wikis do
      resources :collaborators, :discussions, only: [:create]
    end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
