require 'test_helper'

class OfficesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offiz = offices(:one)
  end

  test "should get index" do
    get offices_url
    assert_response :success
  end

  test "should get new" do
    get new_offiz_url
    assert_response :success
  end

  test "should create offiz" do
    assert_difference('Office.count') do
      post offices_url, params: { offiz: {  } }
    end

    assert_redirected_to offiz_url(Office.last)
  end

  test "should show offiz" do
    get offiz_url(@offiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_offiz_url(@offiz)
    assert_response :success
  end

  test "should update offiz" do
    patch offiz_url(@offiz), params: { offiz: {  } }
    assert_redirected_to offiz_url(@offiz)
  end

  test "should destroy offiz" do
    assert_difference('Office.count', -1) do
      delete offiz_url(@offiz)
    end

    assert_redirected_to offices_url
  end
end
