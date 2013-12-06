Mywiki::Application.routes.draw do
  
  

  get "discussions/create"


  devise_for :users

  resources :charges

  resources :accounts

  resources :webhooks

  resources :categories do
    resources :wikis do
      resources :collaborators, :discussions, only: [:create]
    end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
