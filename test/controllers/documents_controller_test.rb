require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  test "should get trusts" do
    get :trusts
    assert_response :success
  end

end
