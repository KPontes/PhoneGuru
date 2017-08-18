class CreateRuletypes < ActiveRecord::Migration[5.1]
  def change
    create_table :ruletypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
