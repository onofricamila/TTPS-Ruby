require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @exam = exams(:one)
    @result = results(:one)
  end

  test "should get index" do
    get :index, params: { exam_id: @exam }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { exam_id: @exam }
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, params: { exam_id: @exam, result: @result.attributes }
    end

    assert_redirected_to exam_result_path(@exam, Result.last)
  end

  test "should show result" do
    get :show, params: { exam_id: @exam, id: @result }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { exam_id: @exam, id: @result }
    assert_response :success
  end

  test "should update result" do
    put :update, params: { exam_id: @exam, id: @result, result: @result.attributes }
    assert_redirected_to exam_result_path(@exam, Result.last)
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, params: { exam_id: @exam, id: @result }
    end

    assert_redirected_to exam_results_path(@exam)
  end
end
