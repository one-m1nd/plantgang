require "test_helper"

class WaterTrackersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watertracker = watertrackers(:one)
  end

  test "should get index" do
    get watertrackers_url
    assert_response :success
  end

  test "should get new" do
    get new_watertracker_url
    assert_response :success
  end

  test "should create watertracker" do
    assert_difference("Watertracker.count") do
      post watertrackers_url, params: { watertracker: { date: '2006-6-6' } }
    end

    assert_redirected_to watertracker_url(Watertracker.last)
  end

  test "should show watertracker" do
    get watertracker_url(@watertracker)
    assert_response :success
  end

  test "should get edit" do
    get edit_watertracker_url(@watertracker)
    assert_response :success
  end

  test "should update watertracker" do
    patch watertracker_url(@watertracker), params: { watertracker: { date: '2006-06-06' } }
    assert_redirected_to watertracker_url(@watertracker)
  end

  test "should destroy watertracker" do
    assert_difference("Watertracker.count", -1) do
      delete watertracker_url(@watertracker)
    end

    assert_redirected_to watertracker_url
  end
end
