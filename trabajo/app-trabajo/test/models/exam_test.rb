require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  require 'test_helper'
  
    # called before every single test
    setup do
      @exam = exams(:one)
    end
  
    # called after every single test
    teardown do
      # when controller is using cache it may be a good idea to reset it afterwards
      Rails.cache.clear
    end
  
    test "should be valid" do
      assert @exam.valid?
    end
  
    test "should not save exam without title" do
      @exam.title = nil
      assert_not @exam.save
    end

    test "should not save exam without date" do
      @exam.date = nil
      assert_not @exam.save
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
  
end
