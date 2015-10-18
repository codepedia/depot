require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end


  # return the last added product
  self.latest
    Product.order(:updated_at).latest
  end
