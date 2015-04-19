require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(title: "chicken parm", description: "best chicken parm ever", summary: "do this then this then this")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "title should be present" do
    @recipe.title = " "
    assert_not @recipe.valid?
  end
  
  test "title length must not be more than 100 characters" do
    @recipe.title = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "title length must not be less than 5 characters" do
    @recipe.title = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  test "summary length must be less than or equal to 500 characters" do
    @recipe.summary = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "summary length must be more than or equal to 20 characters" do
    @recipe.summary = "a" * 19
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test "description must be less than or equal to 150 characters" do
    @recipe.description = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "description must be more than or equal to 10 characters" do
    @recipe.description = "a" * 9
    assert_not @recipe.valid?
  end
  
end