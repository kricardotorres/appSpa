require 'test_helper'

class CarrouselsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrousel = carrousels(:one)
  end

  test "should get index" do
    get carrousels_url
    assert_response :success
  end

  test "should get new" do
    get new_carrousel_url
    assert_response :success
  end

  test "should create carrousel" do
    assert_difference('Carrousel.count') do
      post carrousels_url, params: { carrousel: { description: @carrousel.description, display_finish: @carrousel.display_finish, display_from: @carrousel.display_from, title: @carrousel.title } }
    end

    assert_redirected_to carrousel_url(Carrousel.last)
  end

  test "should show carrousel" do
    get carrousel_url(@carrousel)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrousel_url(@carrousel)
    assert_response :success
  end

  test "should update carrousel" do
    patch carrousel_url(@carrousel), params: { carrousel: { description: @carrousel.description, display_finish: @carrousel.display_finish, display_from: @carrousel.display_from, title: @carrousel.title } }
    assert_redirected_to carrousel_url(@carrousel)
  end

  test "should destroy carrousel" do
    assert_difference('Carrousel.count', -1) do
      delete carrousel_url(@carrousel)
    end

    assert_redirected_to carrousels_url
  end
end
