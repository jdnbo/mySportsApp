class ChangeAdminDefault < ActiveRecord::Migration
  def change
    change_column_default(:chefs, :admin, false)
  end
end
