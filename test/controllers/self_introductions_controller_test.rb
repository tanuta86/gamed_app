require 'test_helper'

class SelfIntroductionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @self_introduction = self_introductions(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'SelfIntroduction.count' do
      post self_introductions_path, params: { self_introduction: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'SelfIntroduction.count' do
      delete self_introduction_path(@self_introduction)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong self_introduction" do
    log_in_as(users(:michael))
    self_introduction = self_introductions(:ants)
    assert_no_difference 'SelfIntroduction.count' do
      delete self_introduction_path(self_introduction)
    end
    assert_redirected_to root_url
  end
end
