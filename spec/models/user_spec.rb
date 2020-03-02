require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.create(name: "example user", email: "example@example.com")
  end

  it "should be valid" do
    expect(@user.valid?).to be(true)
  end

  it "name should be present" do
    @user.name = "   "
    expect(@user.valid?).to be(false)
  end

  it "email should be present" do
    @user.email = "   "
    expect(@user.email.valid?).to be(false)
  end

  it "name should not be too long" do
    @user.name = "a" * 51
    expect(@user.valid?).to be(false)
  end

  it "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    expect(@user.email.valid?).to be(false)
  end

  it "email validation should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-er@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      #assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  it "email validation should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com USER_at_foo.com user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..net
                           foo@bar..bar..baz.com]
    invalid_addresses.each do |address|
      @user.email = address
      #assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  it "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    #assert_not duplicate_user.valid?
  end

  it "email addresses should be saved as lowercase" do
    address_with_uppercase = "Ex@Example.COM"
    @user.email = address_with_uppercase
    @user.save
    #assert_equal address_with_uppercase.downcase, @user.reload.email
  end

  it "order should be most recent first" do
    #assert_equal users(:most_recent), User.first
  end
end