class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  # TODO need to verify whether topic is new or not
  def create
    user = User.where(email: params[:sender])

    # REVIEW what to do with user that has no login info?
    if (user.nil?)
      user = User.create!(email: params[:sender])
    end

    topic = Topic.where(title: params[:subject])

    if (topic.nil?)
      topic = Topic.create!(title: params[:subject], user: user)
    end

    bookmark = topic.bookmarks.create!(url: params["body-plain"])

    head 200
  end
end
