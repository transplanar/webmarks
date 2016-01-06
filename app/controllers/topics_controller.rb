class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    # REVIEW needed?
    authorize @topic
    # @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

# REVIEW to make more dry, could you just have it call show? (similar to pundit?)
  # TODO implement topic edit
  def edit
    authorize @topic
    # @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    set_log(@topic)

    if @topic.save
      flash[:notice] = "Topic \##{@log} was successfully created."
      redirect_to root_path
    else
      render :new
    end
  end

  # TODO update redirects
  def update
    authorize @topic
    set_log(@topic)

    if @topic.update(topic_params)
      redirect_to root_path
      flash[:notice] = "Topic \##{@log} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @topic
    
    set_log(@topic)

    @topic.destroy
    redirect_to root_path
    flash[:notice] = "Topic \##{@log} was successfully destroyed."
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
      # @topic = Topic.find(params[:topic_id])
    end

    def topic_params
      params.require(:topic).permit(:title, :user_id)
    end

    def set_log(item)
      @log = item.title;
    end
end
