require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # called before every single test
  setup do
    @student = students(:one)
  end

  test "should not save student without a surname" do
    @student.surname = nil
    assert_not @student.save
  end

  test "should not save student without a name" do
    @student.name = nil
    assert_not @student.save
  end

  test "should not save student without a dni" do
    @student.dni = nil
    assert_not @student.save
  end

  test "should not save student without a number" do
    @student.number = nil
    assert_not @student.save
  end

  test "should not save student without a email" do
    @student.email = nil
    assert_not @student.save
  end

  test "email should be a valid one" do
    @student.email = 'lala'
    assert_not @student.valid?
  end

  test "dni should be a number" do
    @student.dni = 'lala'
    assert_not @student.valid?
  end

  test "dni should not have less than 7 digits" do
    @student.dni = 123456
    assert_not @student.valid?
  end

  test "dni should not have more than 8 digits" do
    @student.dni = 123456789
    assert_not @student.valid?
  end

  test "number should be a number" do
    @student.number = 'lala'
    assert_not @student.valid?
  end

  test "surname should be string" do
    @student.surname = 100
    assert_not @student.valid?
  end

  test "name should be string" do
    @student.name = 100
    assert_not @student.valid?
  end

  test "should not save student with another student's dni in the same course" do
    std_two = students(:two)
    std_two.dni = @student.dni
    std_two.course = @student.course
    @student.save!
    assert_not std_two.valid?
  end

  test "should save student with another student's dni in another course" do
    std_two = students(:two)
    std_two.dni = @student.dni
    @student.save!
    assert std_two.valid?
  end

  test "should not save student with another student's number in the same course" do
    std_two = students(:two)
    std_two.number = @student.number
    std_two.course = @student.course
    @student.save!
    assert_not std_two.valid?
  end

  test "should save student with another student's number in another course" do
    std_two = students(:two)
    std_two.number = @student.number
    @student.save!
    assert std_two.valid?
  end

  test "should not save student with another student's email in the same course" do
    std_two = students(:two)
    std_two.email = @student.email
    std_two.course = @student.course
    @student.save!
    assert_not std_two.valid?
  end

  test "should save student with another student's email in another course" do
    std_two = students(:two)
    std_two.email = @student.email
    @student.save!
    assert std_two.valid?
  end
 
  test "should not save student with another student's name and surname in the same course" do
    std_two = students(:two)
    std_two.name = @student.name
    std_two.surname = @student.surname
    std_two.course = @student.course
    @student.save!
    assert_not std_two.valid?
  end

  test "should save student with another student's name and surname in another course" do
    std_two = students(:two)
    std_two.name = @student.name
    std_two.surname = @student.surname
    @student.save!
    assert std_two.valid?
  end

  # ---------------------------------------------------------------------------------------------------------------------------------
  # testing interactions with other models
  # ---------------------------------------------------------------------------------------------------------------------------------

  test "should recognize she attended to exam one" do
    exam = exams(:one)
    assert @student.attended_to? exam
  end

  test "should recognize she didn't attend to exam two" do
    exam = exams(:two)
    assert_not @student.attended_to? exam
  end

  test "should know she obtained result one in exam one" do
    exam = exams(:one)
    result = results(:one)
    assert (@student.score_for(exam) == result)
  end

end
