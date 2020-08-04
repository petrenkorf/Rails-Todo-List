class PublicListsPage < BasePage
  def visit_page
    visit bookmarks_path

    self
  end

  def bookmark_first_list
    within all('.cards-container').first do
      within all('.card').first do
        click_link "Bookmark"
      end
    end
  end
end
