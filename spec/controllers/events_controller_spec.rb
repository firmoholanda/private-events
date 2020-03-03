require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  before :each do
    @event = events(:one)
    @non_host = users(:two)
  end

  it "should get create" do
    get events_create_url
    expect(response).to eql(:success)
  end

  it "should redirect show when not logged in" do
    get :show, id: @event
    #assert_redirected_to login_url
  end

end
