require "application_system_test_case"

class GeneraTest < ApplicationSystemTestCase
  setup do
    @genus = genera(:one)
  end

  test "visiting the index" do
    visit genera_url
    assert_selector "h1", text: "Genera"
  end

  test "should create genus" do
    visit genera_url
    click_on "New genus"

    click_on "Create Genus"

    assert_text "Genus was successfully created"
    click_on "Back"
  end

  test "should update Genus" do
    visit genus_url(@genus)
    click_on "Edit this genus", match: :first

    click_on "Update Genus"

    assert_text "Genus was successfully updated"
    click_on "Back"
  end

  test "should destroy Genus" do
    visit genus_url(@genus)
    click_on "Destroy this genus", match: :first

    assert_text "Genus was successfully destroyed"
  end
end
