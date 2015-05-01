class AddTitleAndDescriptionToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :title, :string
    #add_column :recipes, :description, :string
  end
end
