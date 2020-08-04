class PublicListController < DashboardController
  def index
    @lists = List.visible_for_users.where("user_id != ?", current_user.id)    
  end
end
