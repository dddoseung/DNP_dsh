Rails.application.routes.draw do

  get 'search/index'
  get 'search/result'
  get 'posts/index'
  devise_for :users
  root 'posts#show'
  resources :tag
  resources :mypage, only: [:index]

  resources :posts, except: [:show] do
    post "/like", to: "likes#like_toggle"
    post "/dislike",to: "dislikes#dislike_toggle"
    resources :comments, only: [:create, :destroy]
  end
  resources :follows, only: [:create, :destroy]
  get '/posts/hashtag/:name', to: 'posts#hashtags'
  get 'search' => 'search#index'
end
