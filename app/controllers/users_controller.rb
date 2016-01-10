class UsersController < ApplicationController
  def show
    # TODO update to show different users
    # @topics = Topic.find(params[:id])
    # REVIEW better way to do this?
    @user = User.find(params[:id])

    # @user_topics = Topic.where(user: @user)
    @topics = Topic.where(user: @user)



    # @user_bookmarks = []

    # user_topics.each do |topic|
    #   @user_bookmarks.push(topic.bookmarks)
    # end

    # user_bookmarks.flatten

    # @liked_bookmarks = []

    # Bookmark.all do |bk|
      # @liked_bookmarks.push(bk) if user.liked(bk)
    # end
  end
end
