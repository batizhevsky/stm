class Web::CommentsController < Web::ApplicationController
  before_filter :auth!

  def create
    comment_body = params[:comment][:comment]
    @story = Story.find(params[:comment][:story_id])
    @comment = CommentType.new(story: @story, comment: comment_body, user: current_user)
    if @comment.save
      flash_success
    else
      flash_error
    end
    redirect_to request.referer || story_url(@story)
  end

  def destroy
    comment = StoryComment.find(params[:id])
    comment.destroy
    redirect_to story_url(comment.story)
  end
end
