class AddAncestryToBokmark < ActiveRecord::Migration[7.0]
  def change
    add_column :bokmarks, :ancestry, :string
    add_index :bokmarks, :ancestry
  end
end
