class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # TODO implement user
    # user = User.new(params[:sender])

    topic = Topic.new(title: params[:subject])

    #TODO check if user is nil. If yes, make new user

    # TODO if topic is nil, create a new topic


    # bookmark = topic.bookmarks.new(url: params["body-plain"])
    bookmark = topic.bookmarks.new(url: params["stripped-text"])

    # REVIEW (B) how does this work? are headers responses to a query?
    head 200
  end
end
