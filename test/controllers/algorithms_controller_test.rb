require 'test_helper'

class AlgorithmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get algorithms_index_url
    assert_response :success
  end

  test "should get show" do
    get algorithms_show_url
    assert_response :success
  end

  test "should get new" do
    get algorithms_new_url
    assert_response :success
  end

end
