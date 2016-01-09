class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.where(email: params[:sender])

    # REVIEW what to do with user that has no login info?
    if (user.nil?)
      user = User.new(email: params[:sender])
    end

    topic = Topic.where(title: params[:subject])

    if (topic.nil?)
      topic = Topic.new(title: params[:subject], user: user)
    end

    bookmark = topic.bookmarks.new(url: params["body-plain"])

    head 200
  end
end
