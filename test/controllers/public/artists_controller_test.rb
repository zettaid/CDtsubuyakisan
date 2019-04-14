require 'test_helper'

class Public::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_artists_show_url
    assert_response :success
  end

end
