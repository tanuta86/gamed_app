require 'test_helper'

class HaveInformationTest < ActiveSupport::TestCase
  
  def setup
    @have_information = HaveInformation.new(user_id: users(:michael).id,
                                     information_id: information(:maruo).id)
  end

  test "should be valid" do
    assert @have_information.valid?
  end

  test "should require a user_id" do
    @have_information.user_id = nil
    assert_not @have_information.valid?
  end

  test "should require a haveed_id" do
    @have_information.information_id = nil
    assert_not @have_information.valid?
  end
end
