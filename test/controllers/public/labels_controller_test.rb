require 'test_helper'

class Public::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_labels_show_url
    assert_response :success
  end

end
