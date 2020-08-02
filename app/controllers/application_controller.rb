class ApplicationController < ActionController::Base
  def redirect_to_lists
    redirect_to lists_path
  end
end
