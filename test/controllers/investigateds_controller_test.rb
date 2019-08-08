require 'test_helper'

class InvestigatedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investigated = investigateds(:one)
  end

  test "should get index" do
    get investigateds_url
    assert_response :success
  end

  test "should get new" do
    get new_investigated_url
    assert_response :success
  end

  test "should create investigated" do
    assert_difference('Investigated.count') do
      post investigateds_url, params: { investigated: { lastname1: @investigated.lastname1, name: @investigated.name } }
    end

    assert_redirected_to investigated_url(Investigated.last)
  end

  test "should show investigated" do
    get investigated_url(@investigated)
    assert_response :success
  end

  test "should get edit" do
    get edit_investigated_url(@investigated)
    assert_response :success
  end

  test "should update investigated" do
    patch investigated_url(@investigated), params: { investigated: { lastname1: @investigated.lastname1, name: @investigated.name } }
    assert_redirected_to investigated_url(@investigated)
  end

  test "should destroy investigated" do
    assert_difference('Investigated.count', -1) do
      delete investigated_url(@investigated)
    end

    assert_redirected_to investigateds_url
  end
end
