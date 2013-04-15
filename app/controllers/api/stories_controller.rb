class Api::StoriesController < Api::ApplicationController

  def index
    @stories = Story.all

    respond_with @stories
  end

  def show
    @story = Story.find(params[:id])

    respond_with @stories
  end

  def search
    @filter = Story.ransack(params[:q])
    @stories = @filter.result

    respond_with @stories
  end

end
