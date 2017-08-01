class CreateNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :numbers do |t|
      t.string :number
      t.string :cn
      t.string :prefix
      t.string :mcdu
      t.string :mask
      t.text :validate

      t.timestamps
    end
  end
end
