class BookmarkListController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    return redirect_to :back if self.available_for_bookmark?
   
    current_user.bookmarks.create({list_id: params[:id]})

    redirect_to lists_public_path
  end

  protected 

  def available_for_bookmark?
    list_is_bookmarkable? == false && list_already_bookmarked? == false
  end
  
  def list_is_bookmarkable?
    List.not_belonging_to_user(current_user)
        .visible_for_users
        .where(id: params[:id])
  end

  def list_already_bookmarked?
    Bookmark.from_user(current_user)
            .where(id: params[:id])
  end
end
