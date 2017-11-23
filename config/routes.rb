Rails.application.routes.draw do
  # #1 call resources method and pass it to a Symbol
  resources :posts

  # #2 this route allows users to visit /about rather than welcome/about
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
