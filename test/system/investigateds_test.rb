require "application_system_test_case"

class InvestigatedsTest < ApplicationSystemTestCase
  setup do
    @investigated = investigateds(:one)
  end

  test "visiting the index" do
    visit investigateds_url
    assert_selector "h1", text: "Investigateds"
  end

  test "creating a Investigated" do
    visit investigateds_url
    click_on "New Investigated"

    fill_in "Lastname1", with: @investigated.lastname1
    fill_in "Name", with: @investigated.name
    click_on "Create Investigated"

    assert_text "Investigated was successfully created"
    click_on "Back"
  end

  test "updating a Investigated" do
    visit investigateds_url
    click_on "Edit", match: :first

    fill_in "Lastname1", with: @investigated.lastname1
    fill_in "Name", with: @investigated.name
    click_on "Update Investigated"

    assert_text "Investigated was successfully updated"
    click_on "Back"
  end

  test "destroying a Investigated" do
    visit investigateds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Investigated was successfully destroyed"
  end
end
