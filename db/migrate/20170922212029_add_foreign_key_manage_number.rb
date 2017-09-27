class AddForeignKeyManageNumber < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :manages, :numbers, column: :manager_id
    add_foreign_key :manages, :numbers, column: :subordinate_id
  end
end
