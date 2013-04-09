class Web::StoriesController < Web::ApplicationController
  before_filter :auth!, except: [:show, :index]

  def show
    story_id = params[:id]
    @story = Story.find_by_id(story_id)
    redirect_to stories_url, error: "Story not found" unless @story
    @comments = @story.comments
  end

  def index
    @stories = Story.scoped

    if (sort_story = params[:story])
      if sort_story[:user].present?
        @stories = @stories.where(user_id: sort_story[:user])
      end
      if sort_story[:state].present?
        @stories = @stories.where(state: sort_story[:state])
      end
    end
  end

  def update
    @story = StoryType.find params[:id]
    if @story.update_attributes params[:story]
      flash[:notice] = "Story successfull updated"
      redirect_to story_url(@story.id)
    else
      flash[:error] = "Can't update story"
      render :show
    end
  end

  def create
    @story = StoryType.new(params[:story])
    if @story.save
      redirect_to story_url(@story.id), notice: "Story successfully created"
    else
      render :new, error: "Story not created"
    end
  end

  def new
    @story = StoryType.new
    @users = User.all
  end

  def event
    @story = Story.find params[:id]
    @story.fire_events(params[:event]) ? flash_success : flash_error
    redirect_to request.referer || story_url(@story)
  end
end
