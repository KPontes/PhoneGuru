class CreateJoinTableNumberRuletype < ActiveRecord::Migration[5.1]
  def change
    create_join_table :numbers, :ruletypes do |t|
      # t.index [:number_id, :ruletype_id]
      # t.index [:ruletype_id, :number_id]
    end
  end
end
