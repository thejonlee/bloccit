Rails.application.routes.draw do
  resources :topics do
    # pass `resources :posts` to the `resources :topics` block, which nests post routes under the topic routes
    resources :posts, except: [:index]
  end

  # the only hash prevents Rails from creating unnecessary routes
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  # this route allows users to visit /about rather than welcome/about
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
