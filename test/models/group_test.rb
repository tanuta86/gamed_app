require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @group = @user.groups.build(name: "Lorem ipsum")
  end

  test "should be valid" do
    assert @group.valid?
  end

  test "user id should be present" do
    @group.user_id = nil
    assert_not @group.valid?
  end
  
  test "name should be present" do
    @group.name = "   "
    assert_not @group.valid?
  end

  test "name should be at most 140 characters" do
    @group.name = "a" * 51
    assert_not @group.valid?
  end
  
  test "explanation should be at most 140 characters" do
    @group.name = "a" * 141
    assert_not @group.valid?
  end
end