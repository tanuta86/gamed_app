require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase

  def setup
    @favorite = Favorite.new(user_id: users(:michael).id,
                                     group_id: groups(:archer).id)
  end

  test "should be valid" do
    assert @favorite.valid?
  end

  test "should require a user_id" do
    @favorite.user_id = nil
    assert_not @favorite.valid?
  end

  test "should require a goup_id" do
    @favorite.group_id = nil
    assert_not @favorite.valid?
  end
end
