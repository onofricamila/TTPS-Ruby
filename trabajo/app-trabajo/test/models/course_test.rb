require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # called before every single test
  
   setup do
    @course = courses(:one)
  end

  test "should not save course with a year < 1990" do
    @course.year = 1810
    assert_not @course.save
  end
end
