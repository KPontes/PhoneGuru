class AddManageConstraint < ActiveRecord::Migration[5.1]
  def change
    add_index(:manages, [:manager_id, :subordinate_id], :unique => true)
  end
end
