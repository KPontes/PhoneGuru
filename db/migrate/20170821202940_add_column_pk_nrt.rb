class AddColumnPkNrt < ActiveRecord::Migration[5.1]
  def change
    add_column :numbers_ruletypes, :id, :primary_key
  end
end
