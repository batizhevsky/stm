class Web::CommentsController < Web::ApplicationController
  before_filter :auth!

  def new
    story = Story.find(params[:story_id])
    @comment = story.comments.build
  end

  def create
    story = Story.find(params[:story_id])
    @comment = story.comments.build(params[:story_comment].merge(user: current_user))
    if @comment.save
      flash_success
      redirect_to story_url(story)
    else
      flash_error
      render :new
    end
  end

  def destroy
    story = Story.find(params[:story_id])
    comment = story.comments.find(params[:id])
    comment.destroy
    redirect_to story_url(story)
  end
end
