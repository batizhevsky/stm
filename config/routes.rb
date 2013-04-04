SimpleTaskManager::Application.routes.draw do

  scope module: "web" do
    resources :stories, only: [:show, :index, :update, :create, :new] 
    resources :users, only: [:show, :new, :destroy, :create]
    resource :session, only: [:new, :create, :destroy]
  end

  scope module: 'api' do
    resources :comments, only: [:show, :create, :destroy]
  end

  post '/stories/:id/event/:event' => 'web/stories#event', as: 'story_event'

  root :to => 'web::stories#index'
end
