require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  def setup
    @tag = Tag.new(group_id: groups(:michael).id,
                                     information_id: information(:maruo).id)
  end

  test "should be valid" do
    assert @tag.valid?
  end

  test "should require a group_id" do
    @tag.group_id = nil
    assert_not @tag.valid?
  end

  test "should require a had_id" do
    @tag.information_id = nil
    assert_not @tag.valid?
  end
end
