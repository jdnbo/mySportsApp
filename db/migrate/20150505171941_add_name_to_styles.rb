class AddNameToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :name, :string
  end
end
