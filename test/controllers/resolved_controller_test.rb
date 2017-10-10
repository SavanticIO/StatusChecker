require 'test_helper'

class ResolvedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resolved_index_url
    assert_response :success
  end

end
