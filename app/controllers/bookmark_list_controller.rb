class BookmarkListController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    return redirect_back(fallback_location: lists_public_path) if !self.available_for_bookmark?
   
    bookmark_list_for_current_user

    redirect_to lists_public_path
  end

  protected 

  def bookmark_list_for_current_user
    current_user.bookmarks.create(list_id: params[:list_id])
  end

  def available_for_bookmark?
    list_is_bookmarkable? == true && list_already_bookmarked? == false
  end
  
  def list_is_bookmarkable?
    !List.not_belonging_to_user(current_user)
         .visible_for_users
         .where(id: params[:list_id])
         .first
         .nil?
  end

  def list_already_bookmarked?
    !Bookmark.from_user(current_user)
             .where(list_id: params[:list_id])
             .first
             .nil?
  end
end
