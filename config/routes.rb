JuniorWay::Application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'sessions' }

  root to: 'posts#index'

  resources :posts, param: :url_link do
    collection do
      resource :change_state, only: [:update], module: 'posts'
    end
  end

  resources :subscriptions, only: [:index, :create, :destroy] do
    get 'send_reminder', on: :collection
    get 'delete_notifier', on: :collection
  end

  resources :tags
  resource :search, only: [:show], module: 'posts'

  get 'sitemap.xml' => 'sitemap#index', defaults: { format: 'xml' }
end
