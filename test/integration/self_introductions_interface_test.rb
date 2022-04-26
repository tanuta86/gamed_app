require 'test_helper'

class SelfIntroductionsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "self_introduction interface" do
    log_in_as(@user)
    get root_path
    content = "This self_introduction really ties the room together"
    assert_no_difference 'SelfIntroduction.count'do
      post self_introductions_path, params: { self_introduction: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
  end
end
