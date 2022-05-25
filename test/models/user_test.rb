require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
    password: "foobar", password_confirmation: "foobar")
    @group = Group.new(name: "Example Group", user_id: users(:michael).id )
  end

  test "should be valid" do
    assert @user.valid?
    assert @group.valid?    
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
  
    test "associated self_introductions should be destroyed" do
    @user.save
    @user.build_self_introduction(content: "Lorem ipsum").save
    assert_difference 'SelfIntroduction.count', -1 do
      @user.destroy
    end
  end

  test "should follow and unfollow a user" do
    michael  = users(:michael)
    archer   = users(:archer)
    assert_not michael.following?(archer)
    michael.follow(archer)
    assert michael.following?(archer)
    assert archer.followers.include?(michael)
    michael.unfollow(archer)
    assert_not michael.following?(archer)
  end
  
  test "feed should have the right posts" do
    michael = users(:michael)
    archer  = users(:archer)
    lana    = users(:lana)
    # フォローしているユーザーの投稿を確認
  
      assert michael.feed.include?(lana.self_introduction)
    
    # 自分自身の投稿を確認
      assert michael.feed.include?(michael.self_introduction)
    
    # フォローしていないユーザーの投稿を確認
    assert_not michael.feed.include?(archer.self_introduction)
    
  end

  test "should have and unhave a user" do
    michael = users(:michael)
    maruo  = information(:maruo)
    assert_not michael.have?(maruo)
    michael.have(maruo)
    assert michael.have?(maruo)
    assert maruo.users.include?(michael)
    michael.unhave(maruo)
    assert_not michael.have?(maruo)
  end
  
  test "should favorite and not_favorite a user" do
    michael = users(:michael)
    archer  = groups(:archer)
    assert_not michael.favorite?(archer)
    michael.favorite(archer)
    assert michael.favorite?(archer)
    michael.not_favorite(archer)
    assert_not michael.favorite?(archer)
  end
  
  test "associated microposts should be destroyed" do
    @user.save
    # Micropost.create!(content: "Lorem ipsum", user_id: @user.id, group_id: groups(:michael).id)
    @user.microposts.build(content: "Lorem ipsum", group_id: groups(:michael).id).save! 
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end
end

