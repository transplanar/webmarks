class LikesController < ApplicationController
  before_action :set_bookmark, only: [:new, :create, :destroy]

  def new
    # REVIEW use current_user here?
    @like = Like.new(bookmark: @bookmark, user: current_user)
  end

  def create
  #  @bookmark = Bookmark.find(params[:bookmark_id])
   set_log(@bookmark)

   like = current_user.likes.build(bookmark: @bookmark)

   if like.save
     # Add code to generate a success flash and redirect to @bookmark
     flash[:notice] = "Like generated for '#{@log}'."
   else
     # Add code to generate a failure flash and redirect to @bookmark

     flash[:alert] = "Like failed for '#{@log}'."

    #  TODO figure out better redirect
    #  render @bookmark.topic
   end

  #  redirect_to @bookmark.topic
   redirect_to :back
 end

 def destroy
   # Get the bookmark from the params
   # Find the current user's like with the ID in the params
   set_log(@bookmark)
  #  FIXME this raises errors when not logged in.
   like = @bookmark.likes.where(user_id: current_user.id).first

   if like.destroy
     # Flash success and redirect to @bookmark
     flash[:notice] = "Like removed for '#{@log}'."
    #  TODO update redirect
    #  redirect_to root_path
   else
     # Flash error and redirect to @bookmark
     flash[:alert] = "Unable to remove like for '#{@log}'. Please try again"

    #  redirect_to root_path
   end

   redirect_to :back
 end

 private

 def set_bookmark
   @bookmark = Bookmark.find(params[:bookmark_id])
 end
end
