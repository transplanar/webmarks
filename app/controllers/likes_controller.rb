class LikesController < ApplicationController
  before_action :set_bookmark, only: [:new, :create, :destroy]

  def new
    @like = Like.new(bookmark: @bookmark, user: current_user)
  end

  def create
    authorize @bookmark

   like = current_user.likes.build(bookmark: @bookmark)

   if like.save
     flash[:notice] = "Like generated for '#{@bookmark.url}'."
   else
     flash[:alert] = "Like failed for '#{@bookmark.url}'."
   end

   redirect_to :back
 end

 def destroy
   authorize @bookmark

   like = @bookmark.likes.where(user_id: current_user.id).first

   if like.destroy
     flash[:notice] = "Like removed for '#{@bookmark.url}'."
   else
     flash[:alert] = "Unable to remove like for '#{@bookmark.url}'. Please try again"
   end

   redirect_to :back
 end

 private

 def set_bookmark
   @bookmark = Bookmark.find(params[:bookmark_id])
 end
end
