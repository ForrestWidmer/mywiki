Mywiki::Application.routes.draw do
  
  resources :creates

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
