class ListsPage < BasePage
  def visit_page
    visit lists_path

    self
  end

  def close_first_list
    within all('.cards-container').first do
      within all('.card').first do
        #click_button "Close"
      end
    end
  end
end
