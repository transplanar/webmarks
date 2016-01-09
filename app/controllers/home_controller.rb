class HomeController < ApplicationController
  def index
    if current_user.present?
      @topics = current_user.topics
    else
      @topics = Topic.all
    end
  end

  def about
  end
end
