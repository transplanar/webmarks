class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    authorize @topic
  end

  def new
    @topic = Topic.new
  end

  def edit
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic \##{@topic.title} was successfully created."
      redirect_to root_path
    else
      render :new
    end
  end

  # TODO update redirects
  def update
    authorize @topic

    if @topic.update(topic_params)
      redirect_to root_path
      flash[:notice] = "Topic \##{@topic.title} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @topic

    @topic.destroy
    redirect_to root_path
    flash[:notice] = "Topic \##{@topic.title} was successfully destroyed."
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :user_id)
    end
end
