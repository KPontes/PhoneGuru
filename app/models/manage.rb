class Manage < ApplicationRecord
  has_many :numbers, class_name: "Number", through: "subordinate_id"
  #belongs_to :number
  #belongs_to :subordinate, :class_name => "Number"
  
  def managed(manager_id)
    return Manage.where("manager_id = ?", manager_id)
  end
end
