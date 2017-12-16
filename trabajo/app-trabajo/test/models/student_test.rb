require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # called before every single test
  setup do
    @student = students(:one)
  end

  test "should be valid" do
    assert @student.valid?
  end

end
