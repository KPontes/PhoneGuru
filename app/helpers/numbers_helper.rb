module NumbersHelper
  def get_subordinates(manager_id)
    @mang = Manage.where("manager_id = ?", manager_id)
    return @mang
  end
end
