class ListsFormPage < BasePage
  def visit_page
    visit lists_new_path

    self
  end

  def fill_form(title, visibility)
    fill_in "list[title]", with: title

    self
  end

  def add_new_task(content)
    click_button "Add Task"
    within all('.cards-container').last do
      find('.text-input').set content
    end

    self
  end

  def submit
    click_button "Save"

    self
  end
end
