class BookmarkListController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    current_user.bookmarks.create({list_id: params[:id]})
  end
end
