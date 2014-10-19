JuniorWay::Application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'sessions' }

  root to: 'posts#index'

  resources :posts do
    collection do
      resource :change_state, only: [:update]
    end
  end

  resources :subscriptions, only: [:index, :create, :destroy] do
    get 'send_reminder', on: :collection
    get 'delete_notifier', on: :collection
  end

  resources :tags
  resource :search, only: [:show]

  get 'sitemap.xml' => 'sitemap#index', defaults: { format: 'xml' }
end
