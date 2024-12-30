require "test_helper"

class SeizuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seizure = seizures(:one)
  end

  test "should get index" do
    get seizures_url
    assert_response :success
  end

  test "should get new" do
    get new_seizure_url
    assert_response :success
  end

  test "should create seizure" do
    assert_difference("Seizure.count") do
      post seizures_url, params: { seizure: { end_time: @seizure.end_time, person_id: @seizure.person_id, start_time: @seizure.start_time } }
    end

    assert_redirected_to seizure_url(Seizure.last)
  end

  test "should show seizure" do
    get seizure_url(@seizure)
    assert_response :success
  end

  test "should get edit" do
    get edit_seizure_url(@seizure)
    assert_response :success
  end

  test "should update seizure" do
    patch seizure_url(@seizure), params: { seizure: { end_time: @seizure.end_time, person_id: @seizure.person_id, start_time: @seizure.start_time } }
    assert_redirected_to seizure_url(@seizure)
  end

  test "should destroy seizure" do
    assert_difference("Seizure.count", -1) do
      delete seizure_url(@seizure)
    end

    assert_redirected_to seizures_url
  end
end
