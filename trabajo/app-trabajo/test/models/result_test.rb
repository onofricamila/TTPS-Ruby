require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # called before every single test
  setup do
    @result = results(:one)
  end
  
  test "should be valid" do
    assert @result.valid?
  end
  
  test "should not save result without score" do
    @result.score = nil
    assert_not @result.save
  end

  test "should not save result without student id" do
    @result.student_id = nil
    assert_not @result.save
  end
  
  test "score should not be negative" do
    @result.score = -10
    assert_not @result.valid?
  end

  test "score should not be greater than 100" do
    @result.score = 200
    assert_not @result.valid?
  end
  
  test "should not save result with another result's student in the same exam" do
    duplicate_result = @result.dup
    @result.save!
    duplicate_result.score = 50
    assert_not duplicate_result.valid?
  end

  test "result one should realize the exam associated was passed" do
    assert @result.passed?
  end

  test "result two should realize the exam associated was failed" do
    result = results(:two)
    assert_not result.passed?
  end
end
