JuniorWay::Application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'sessions' }

  root to: 'posts#index'

  resources :posts
end
