Rails.application.routes.draw do
  resources :advertisements 
  resources :posts

  # #2 this route allows users to visit /about rather than welcome/about
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
