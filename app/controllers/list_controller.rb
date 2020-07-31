class ListController < DashboardController
  def index
    @lists = current_user.lists
  end

  def new
  end

  def create
  end
end
