require "test_helper"
class FertilizerTrackersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fertilizer_tracker = fertilizer_trackers(:one)
  end

  test "should get index" do
    get fertilizer_trackers_url
    assert_response :success
  end

  test "should get new" do
    get new_fertilizer_tracker_url
    assert_response :success
  end

  test "should create fertilizer_tracker" do
    assert_difference("FertilizerTracker.count") do
      post fertilizer_trackers_url, params: { fertilizer_tracker: { date: '2006-6-6', name: 'giga' } }
    end

    assert_redirected_to fertilizer_tracker_url(FertilizerTracker.last)
  end

  test "should show fertilizer_tracker" do
    get fertilizer_tracker_url(@fertilizer_tracker)
    assert_response :success
  end

  test "should get edit" do
    get edit_fertilizer_tracker_url(@fertilizer_tracker)
    assert_response :success
  end

  test "should update fertilizer_tracker" do
    patch fertilizer_tracker_url(@fertilizer_tracker), params: { fertilizer_tracker: { date: '2006-06-06' } }
    assert_redirected_to fertilizer_tracker_url(@fertilizer_tracker)
  end

  test "should destroy fertilizer_tracker" do
    assert_difference("FertilizerTracker.count", -1) do
      delete fertilizer_tracker_url(@fertilizer_tracker)
    end

    assert_redirected_to fertilizer_trackers_url
  end
end
