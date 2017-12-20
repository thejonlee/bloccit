Rails.application.routes.draw do
  resources :topics do
    # pass `resources :posts` to the `resources :topics` block, which nests post routes under the topic routes
    resources :posts, except: [:index]
  end

  # create only posts/:post_id/comments routes
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  # the only hash prevents Rails from creating unnecessary routes
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  # this route allows users to visit /about rather than welcome/about
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
