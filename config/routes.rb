Mywiki::Application.routes.draw do
  
  
  get "account/index"

  get "account/paid"

  get "discussions/create"

  devise_for :users

  resources :charges

  resources :categories do
    resources :wikis, except: [:index] do
      resources :discussions, only: [:create]
    end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
