class Api::CommentsController < Api::ApplicationController 
  respond_to :json

  def create
    comment_body = params[:comment][:comment]
    @story = Story.find(params[:comment][:story_id])
    CommentType.create(story: @story, comment: comment_body, user: current_user) if @story
    redirect_to request.referer || story_url(@story) 
  end
end
