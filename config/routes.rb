SimpleTaskManager::Application.routes.draw do
  namespace :api do
    resources :stories, only: [:index, :show, :create, :update, :destroy], format: true
  end

  root to: 'web/welcome#index'

  scope '(:locale)', constraints: { locale: /[a-zA-Z][a-zA-Z]/} do
    scope module: "web" do
      resources :stories, only: [:show, :edit, :index, :update, :create, :new] do
        resources :comments, only: [:create, :destroy, :new]
      end
      resources :users, only: [:show, :new, :destroy, :create, :update]
      resource :session, only: [:new, :create, :destroy]
    end

    root :to => 'web/stories#index', as: :root_with_locale
  end


end
