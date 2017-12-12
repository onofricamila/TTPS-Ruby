require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @exam = exams(:one)
    @note = notes(:one)
  end

  test "should get index" do
    get :index, params: { exam_id: @exam }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { exam_id: @exam }
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, params: { exam_id: @exam, note: @note.attributes }
    end

    assert_redirected_to exam_note_path(@exam, Note.last)
  end

  test "should show note" do
    get :show, params: { exam_id: @exam, id: @note }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { exam_id: @exam, id: @note }
    assert_response :success
  end

  test "should update note" do
    put :update, params: { exam_id: @exam, id: @note, note: @note.attributes }
    assert_redirected_to exam_note_path(@exam, Note.last)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, params: { exam_id: @exam, id: @note }
    end

    assert_redirected_to exam_notes_path(@exam)
  end
end
