class PublicListController < DashboardController
  def index
    @lists = List.visible_for_users.not_belonging_to_user(current_user)    
  end
end
