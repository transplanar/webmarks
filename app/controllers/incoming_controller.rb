class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  # TODO need to verify whether topic is new or not
  def create
    user = User.where(email: params[:sender]).first

    if user
      # REVIEW what to do with user that has no login info?
      # if (user.nil?)
      #   user = User.create!(email: params[:sender])
      # end

      topic = Topic.where(title: params[:subject]).first

      if (topic.nil?)
        topic = Topic.create!(title: params[:subject], user: user)
        # topic = Topic.create!(title: params[:subject])
      end

      # bookmark = topic.bookmarks.create!(url: params["body-plain"])
      # topic.bookmarks.create!(url: params["body-plain"])

      Bookmark.create!(url: params["body-plain"], topic: topic)

      # topic.bookmarks.create!(url: params["body-plain"])
    end

    head 200
  end
end
