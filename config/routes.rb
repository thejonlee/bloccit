Rails.application.routes.draw do
  resources :topics do
    # pass `resources :posts` to the `resources :topics` block, which nests post routes under the topic routes
    resources :posts, except: [:index]
  end

  # #2 this route allows users to visit /about rather than welcome/about
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
