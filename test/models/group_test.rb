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

  test "name should be at most 100 characters" do
    @group.name = "a" * 101
    assert_not @group.valid?
  end
  
  test "should tag and untag a group" do
    michael = groups(:michael)
    maruo  = information(:maruo)
    assert_not michael.tag?(maruo)
    michael.tag(maruo)
    assert michael.tag?(maruo)
    assert maruo.groups.include?(michael)
    michael.untag(maruo)
    assert_not michael.tag?(maruo)
  end
end