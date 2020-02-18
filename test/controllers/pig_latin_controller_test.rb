require 'test_helper'

class PigLatinControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pig_latin_index_url
    assert_response :success
  end

end
