require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  require 'test_helper'
  
    # called before every single test
    setup do
      @exam = exams(:one)
    end
  
    test "should not save exam without title" do
      @exam.title = nil
      assert_not @exam.save
    end

    test "should not save exam without date" do
      @exam.date = nil
      assert_not @exam.save
    end

    test "should not save exam with invalid date's year" do
      @exam.date = '2015-12-25'
      assert_not @exam.save
    end

    test "should save exam with date's year greater than course's year by 1" do
      @exam.date = '2018-12-25'
      assert @exam.save
    end

    test "should not save exam without passing_score" do
      @exam.passing_score = nil
      assert_not @exam.save
    end

    test "passing score should not be negative" do
      @exam.passing_score = -10
      assert_not @exam.valid?
    end

    test "passing score should not be greater than 100" do
      @exam.passing_score = 200
      assert_not @exam.valid?
    end
  
    test "should not save exam with another exam's title in the same course" do
      duplicate_exam = @exam.dup
      @exam.save!
      assert_not duplicate_exam.valid?
    end

    test "should save exam with another exam's title in another course" do
      exam = exams(:two)
      exam.title = @exam.title
      @exam.save!
      assert exam.valid?
    end

    test 'should not destroy exam if it has results related' do
      assert_not @exam.destroy
    end

    test 'should destroy exam if it has not results related' do
      assert exams(:three).destroy
    end

  # ---------------------------------------------------------------------------------------------------------------------------------
  # testing interactions with other models
  # ---------------------------------------------------------------------------------------------------------------------------------

    test "should recognize there is a student who attended to exam one" do
      # fixtures fold has a result which belongs to student one and exam one, which
      # captured in @exam
      assert @exam.find_total_attended == 1
    end

    test "should recognize there is only one student who passed exam one" do
      # fixtures fold has a result which belongs to student one and exam one
      assert @exam.find_passing == 1
    end

    test "should recognize the student who attended to exam two failed" do
      # fixtures fold has a result which belongs to student two and exam two
      exam = exams(:two)
      assert exam.find_total_attended == 1
      assert exam.find_passing == 0
    end

end
