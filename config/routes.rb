SimpleTaskManager::Application.routes.draw do

  scope module: "web" do
    resources :stories, only: [:show, :index, :update, :create, :new]
    resources :users, only: [:show, :new, :destroy, :create]
    resource :session, only: [:new, :create, :destroy]
  end

  root :to => 'web::stories#index'
end
