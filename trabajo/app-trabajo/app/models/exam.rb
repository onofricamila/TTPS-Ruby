class Exam < ApplicationRecord
  has_many :results, :dependent => :restrict_with_error
  belongs_to :course

  # we use reject if all_blank because if a blank score is submitted,
  # is it a new record that is invalid (blank name) and should cause the save to fail
  # but we wanna ignore that
  accepts_nested_attributes_for :results,  reject_if: proc { |attributes| attributes['score'].blank? }

  validates_presence_of :title, :date, :passing_score

  validates :title, :uniqueness => {:scope => [:course_id]}

  validates :passing_score, 
    inclusion: { in: 1..100 ,message: "should be a number between 1 and 100, representing a proportion"}

  def find_total_attended
    (Result.find_total_for self).size() 
  end

  def find_passing
    (Result.find_passing_for self).size() 
  end

end
