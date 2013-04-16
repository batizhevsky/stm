class Api::StoriesController < Api::ApplicationController
  before_filter :api_auth!, except: [:index, :show]

  def index
    @filter = Story.ransack(params[:q])
    @stories = @filter.result
  end

  def show
    @story = Story.find(params[:id])
  end

  def create
    @story = StoryType.new(params[:story])

    if @story.save
      render :show, status: :created
    else
      render json: @story.errors, status: :not_acceptable
    end
  end

  def update
    @story = Story.find(params[:id])
    @story.assign_attributes(params[:story])

    if @story.save
      render :show
    else
      render json: @story.errors, status: :not_acceptable
    end
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy
    render nothing: true
  end

end
