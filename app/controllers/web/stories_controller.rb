class Web::StoriesController < Web::ApplicationController
  before_filter :auth!, except: [:show, :index]

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments
  end

  def edit
    @story = Story.find(params[:id])
  end

  def index
    @filter = Story.ransack(params[:q])
    @stories = @filter.result
  end

  def update
    @story = StoryType.find params[:id]
    if @story.update_attributes params[:story]
      flash_success
      redirect_to story_url(@story.id)
    else
      flash_error
      render :show
    end
  end

  def create
    @story = StoryType.new(params[:story])
    if @story.save
      flash_success
      redirect_to story_url(@story.id)
    else
      flash_error
      render :new
    end
  end

  def new
    @story = StoryType.new
    @users = User.all
  end

  def event
    @story = Story.find params[:story_id]
    @story.fire_events(params[:event]) ? flash_success : flash_error
    redirect_to request.referer || story_url(@story)
  end
end
