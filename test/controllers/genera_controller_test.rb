require "test_helper"

class GeneraControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genus = genus(:one)
  end

  test "should get index" do
    get genera_url
    assert_response :success
  end

  test "should get new" do
    get new_genus_url
    assert_response :success
  end

  test "should create genus" do
    assert_difference("Genus.count") do
      post genera_url, params: { genus: { name: 'OmegaGenus' } }
    end

    assert_redirected_to genus_url(Genus.last)
  end

  test "should show genus" do
    get genus_url(@genus)
    assert_response :success
  end

  test "should get edit" do
    get edit_genus_url(@genus)
    assert_response :success
  end

  test "should update genus" do
    patch genus_url(@genus), params: { genus: { name: 'GigaGenus' } }
    assert_redirected_to genus_url(@genus)
  end
end
