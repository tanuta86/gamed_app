require 'test_helper'

class GroupsProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)    
    @group = groups(:michael)
  end
end
