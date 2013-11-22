Mywiki::Application.routes.draw do
  
  resources :wikis

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
