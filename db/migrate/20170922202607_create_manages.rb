class CreateManages < ActiveRecord::Migration[5.1]
  def change
    create_table :manages do |t|
      t.integer :manager_id
      t.integer :subordinate_id

      t.timestamps
    end
  end
end
