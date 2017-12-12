class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def get_subordinates(manager_id)
    @mang = Manage.where("manager_id = ?", manager_id)
    return @mang
  end
end
