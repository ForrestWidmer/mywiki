Mywiki::Application.routes.draw do
  
  devise_for :users

  resources :wikis

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
