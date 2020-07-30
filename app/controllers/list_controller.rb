class ListController < DashboardController
  def index
    @lists = current_user.lists
  end
end
