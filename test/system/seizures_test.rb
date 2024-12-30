require "application_system_test_case"

class SeizuresTest < ApplicationSystemTestCase
  setup do
    @seizure = seizures(:one)
  end

  test "visiting the index" do
    visit seizures_url
    assert_selector "h1", text: "Seizures"
  end

  test "should create seizure" do
    visit seizures_url
    click_on "New seizure"

    fill_in "End time", with: @seizure.end_time
    fill_in "Person", with: @seizure.person_id
    fill_in "Start time", with: @seizure.start_time
    click_on "Create Seizure"

    assert_text "Seizure was successfully created"
    click_on "Back"
  end

  test "should update Seizure" do
    visit seizure_url(@seizure)
    click_on "Edit this seizure", match: :first

    fill_in "End time", with: @seizure.end_time.to_s
    fill_in "Person", with: @seizure.person_id
    fill_in "Start time", with: @seizure.start_time.to_s
    click_on "Update Seizure"

    assert_text "Seizure was successfully updated"
    click_on "Back"
  end

  test "should destroy Seizure" do
    visit seizure_url(@seizure)
    click_on "Destroy this seizure", match: :first

    assert_text "Seizure was successfully destroyed"
  end
end
