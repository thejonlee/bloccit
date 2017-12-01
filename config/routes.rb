Rails.application.routes.draw do
  # call resources method and pass it to a Symbol
  resources :topics
  resources :posts

  # #2 this route allows users to visit /about rather than welcome/about
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
