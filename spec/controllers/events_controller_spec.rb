require 'rails_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @event = events(:one)
    @non_host = users(:two)
  end

  test "should get create" do
    get events_create_url
    assert_response :success
  end

  test "should redirect show when not logged in" do
    get :show, id: @event
    assert_redirected_to login_url
  end


end
