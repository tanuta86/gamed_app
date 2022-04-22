require 'test_helper'

class Self_introductionTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # このコードは慣習的に正しくない
    @self_introduction = @user.build_self_introduction(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @self_introduction.valid?
  end

  test "user id should be present" do
    @self_introduction.user_id = nil
    assert_not @self_introduction.valid?
  end
  
  
  test "content should be present" do
    @self_introduction.content = "   "
    assert_not @self_introduction.valid?
  end

  test "content should be at most 140 characters" do
    @self_introduction.content = "a" * 1001
    assert_not @self_introduction.valid?
  end
end


