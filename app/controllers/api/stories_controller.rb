class Api::StoriesController < Api::ApplicationController

  def index
    @filter = Story.ransack(params[:q])
    @stories = @filter.result

    respond_with @stories
  end

  def show
    @story = Story.find(params[:id])

    respond_with @stories
  end

end
