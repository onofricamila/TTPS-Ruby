require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # called before every single test
  setup do
    @course = courses(:one)
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "should not save course without a year" do
    @course.year = nil
    assert_not @course.save
  end

  test "year should not be too old" do
    @course.year = 1800
    assert_not @course.valid?
  end

  test "should not save course with a year < 1990" do
    @course.year = 1800
    assert_not @course.save
  end

  test "should not save course with another course's year" do
    duplicate_course = @course.dup
    @course.save!
    assert_not duplicate_course.valid?
  end
end
