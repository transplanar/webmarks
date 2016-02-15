class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.where(email: params[:sender]).first

    if user
      topic = Topic.where(title: params[:subject]).first

      if (topic.nil?)
        topic = Topic.create!(title: params[:subject], user: user)
      end

      Bookmark.create!(url: params["body-plain"], topic: topic)
    end

    head 200
  end
end
