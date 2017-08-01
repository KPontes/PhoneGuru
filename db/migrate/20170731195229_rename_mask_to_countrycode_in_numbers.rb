class RenameMaskToCountrycodeInNumbers < ActiveRecord::Migration[5.1]
  def up
    rename_column :numbers, :mask, :countrycode
  end

  def down
    rename_column :numbers, :mask, :countrycode
  end
end
