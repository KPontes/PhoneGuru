module NumbersHelper
  def get_subordinates(manager_id)
    @manage = Manage.where("manager_id = ?", manager_id)
  end
end
