require 'test_helper'

class CursadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cursada = cursadas(:one)
  end

  test "should get index" do
    get cursadas_url
    assert_response :success
  end

  test "should get new" do
    get new_cursada_url
    assert_response :success
  end

  test "should create cursada" do
    assert_difference('Cursada.count') do
      post cursadas_url, params: { cursada: { year: @cursada.year } }
    end

    assert_redirected_to cursada_url(Cursada.last)
  end

  test "should show cursada" do
    get cursada_url(@cursada)
    assert_response :success
  end

  test "should get edit" do
    get edit_cursada_url(@cursada)
    assert_response :success
  end

  test "should update cursada" do
    patch cursada_url(@cursada), params: { cursada: { year: @cursada.year } }
    assert_redirected_to cursada_url(@cursada)
  end

  test "should destroy cursada" do
    assert_difference('Cursada.count', -1) do
      delete cursada_url(@cursada)
    end

    assert_redirected_to cursadas_url
  end
end
