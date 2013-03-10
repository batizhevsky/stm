class Web::StoriesController < Web::ApplicationController
  def show
    @story = Story.find_by_id params[:id]
    redirect_to stories_url, error: "Story not found" unless @story
  end

  def index
    @stories = Story.all
  end

  def update
    story = StoryType.find(params[:id])
    if story.update_attributes(params[:story])
      flash[:notice] = "Story successfull updated"
    else
      flash[:error] = "Can't update story" 
    end
    redirect_to story_url(story.id)
  end

  def create
    story = StoryType.new(params[:story])
    if story.save
      redirect_to story_url(story.id), notice: "Story successfully created"
    else
      render :new, error: "Story not created"
    end
  end

  def new
    @story = StoryType.new
    @users = User.all
  end
end
