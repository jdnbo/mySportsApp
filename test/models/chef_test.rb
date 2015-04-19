require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "John", email: "john@example.com")
  end
  
  test "chef should be valid" do 
    assert @chef.valid?
  end
  
  test "chef name should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chef name should be less than 40 characters" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chef name should be more than 3 characters" do 
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "chef email must be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "chef email must be unique" do
    dup_chef = @chef.dup #duplicate the chef
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com] #%w splits this into an array with the 3 addresses
    valid_addresses.each do |va| 
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid' #the .inspect will show the email address - this is just a custom comment
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name @example eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end

end