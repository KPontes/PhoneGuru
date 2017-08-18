class AddForeignKeyNumberRuletype < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :numbers_ruletypes, :ruletypes
  end
end
