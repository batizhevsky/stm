class Web::StoriesController < Web::ApplicationController
  def show
    story_id = params[:id]
    @story = Story.find_by_id story_id
    redirect_to stories_url, error: "Story not found" unless @story
  end

  def index
    @stories = Story.all
  end

  def update
    story_id = params[:id]
    story_form = params[:story]
    story = StoryType.find story_id
    if story.update_attributes story_form
      flash[:notice] = "Story successfull updated"
    else
      flash[:error] = "Can't update story" 
    end
    redirect_to story_url(story.id)
  end

  def create
    story_form = params[:story]
    story = StoryType.new(story_form)
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
