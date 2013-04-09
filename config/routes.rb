SimpleTaskManager::Application.routes.draw do

  scope module: "web" do
    resources :stories, only: [:show, :edit, :index, :update, :create, :new] do
      resources :comments, only: [:create, :destroy, :new]
    end
    resources :users, only: [:show, :new, :destroy, :create, :update]
    resource :session, only: [:new, :create, :destroy]
  end

  post '/stories/:id/event/:event' => 'web/stories#event', as: 'story_event'

  root :to => 'web::stories#index'
end
