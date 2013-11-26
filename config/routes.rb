Mywiki::Application.routes.draw do
  
  
  devise_for :users

  resources :categories do
    resources :wikis, except: [:index]
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
