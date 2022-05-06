require 'test_helper'

class InformationTest < ActiveSupport::TestCase

  def setup
    @information = Information.new(category: "Example Information", content: "information@example.com")
  end

  test "should be valid" do
    assert @information.valid?
  end

  test "category should be present" do
    @information.category = ""
    assert_not @information.valid?
  end

  test "content should be present" do
    @information.content = "     "
    assert_not @information.valid?
  end
  
  test "category should not be too long" do
    @information.category = "a" * 51
    assert_not @information.valid?
  end

  test "content should not be too long" do
    @information.content = "a" * 51
    assert_not @information.valid?
  end
  
  test "content  should be unique" do
    duplicate_information = @information.dup
    duplicate_information.content = @information.content
    @information.save
    assert_not duplicate_information.valid?
  end
end
