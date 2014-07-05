JuniorWay::Application.routes.draw do
  root to: 'posts#index'

  post 'markdown/preview'
  resources :posts
end
