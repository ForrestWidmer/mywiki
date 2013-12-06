Mywiki::Application.routes.draw do
  
  
  get "webhook/receiver"

  get "webhook_processor/receiver"

  get "account/index"

  get "account/paid"

  get "discussions/create"


  devise_for :users

  resources :charges

  resources :categories do
    resources :wikis do
      resources :discussions, only: [:create]
    end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
