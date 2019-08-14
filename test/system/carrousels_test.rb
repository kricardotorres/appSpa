require "application_system_test_case"

class CarrouselsTest < ApplicationSystemTestCase
  setup do
    @carrousel = carrousels(:one)
  end

  test "visiting the index" do
    visit carrousels_url
    assert_selector "h1", text: "Carrousels"
  end

  test "creating a Carrousel" do
    visit carrousels_url
    click_on "New Carrousel"

    fill_in "Description", with: @carrousel.description
    fill_in "Display finish", with: @carrousel.display_finish
    fill_in "Display from", with: @carrousel.display_from
    fill_in "Title", with: @carrousel.title
    click_on "Create Carrousel"

    assert_text "Carrousel was successfully created"
    click_on "Back"
  end

  test "updating a Carrousel" do
    visit carrousels_url
    click_on "Edit", match: :first

    fill_in "Description", with: @carrousel.description
    fill_in "Display finish", with: @carrousel.display_finish
    fill_in "Display from", with: @carrousel.display_from
    fill_in "Title", with: @carrousel.title
    click_on "Update Carrousel"

    assert_text "Carrousel was successfully updated"
    click_on "Back"
  end

  test "destroying a Carrousel" do
    visit carrousels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carrousel was successfully destroyed"
  end
end
