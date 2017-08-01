class RenameValidadeToValidationNumbers < ActiveRecord::Migration[5.1]
  def up
    rename_column :numbers, :validate, :validation
  end

  def down
    rename_column :numbers, :validate, :validation
  end
end
