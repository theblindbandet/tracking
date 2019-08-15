# frozen_string_literal: true

require "test_helper"

class SessionTest < ActiveSupport::TestCase
  def setup
    @user = users(:mordan)
    @session = Session.new(user_id: @user.id)
  end

  test "should be valid" do
    assert @session.valid?
  end

  test "user id should be present" do
    @session.user_id = nil
    assert_not @session.valid?
  end
end
