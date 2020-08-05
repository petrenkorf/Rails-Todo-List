class ListController < DashboardController
  def index
    @lists = current_user.lists
  end

  def new; end

  def create
    @list = current_user.lists.create list_params

    if @list.invalid?
      error = @list.errors.full_messages.first
      return redirect_to lists_new_path, notice: error if @list.invalid?
    end

    redirect_to lists_path
  end

  def close
    ListDecorator
      .new(load_list_to_close)
      .close
      .save

    redirect_to lists_path
  end

  protected

  def load_list_to_close
    List.where(id: params[:id], user_id: current_user.id).first
  end

  def list_params
    params.require(:list).permit(
      :title,
      :public,
      tasks_attributes: [:description]
    )
  end
end
