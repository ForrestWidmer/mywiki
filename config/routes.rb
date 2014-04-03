Mywiki::Application.routes.draw do
  


  get "users/show"

  get "account/index"

  get "discussions/create"

  #devise_for :users

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :charges

  resources :webhooks

  resources :users, only: [:show]

  resources :categories do
    resources :wikis do
      resources :discussions, only: [:create]
      resources :collaborations
    end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
