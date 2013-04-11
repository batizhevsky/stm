SimpleTaskManager::Application.routes.draw do

  scope module: "web" do
    resources :stories, only: [:show, :edit, :index, :update, :create, :new] do
      resources :comments, only: [:create, :destroy, :new]
      post 'event'
    end
    resources :users, only: [:show, :new, :destroy, :create, :update]
    resource :session, only: [:new, :create, :destroy]
  end

  root :to => 'web::stories#index'
end
