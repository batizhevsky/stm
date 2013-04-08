SimpleTaskManager::Application.routes.draw do

  scope module: "web" do
    resources :stories, only: [:show, :index, :update, :create, :new] 
    resources :users, only: [:show, :new, :destroy, :create, :update]
    resource :session, only: [:new, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  post '/stories/:id/event/:event' => 'web/stories#event', as: 'story_event'

  root :to => 'web::stories#index'
end
