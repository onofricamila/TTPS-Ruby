class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates_presence_of :student_id, :score

  validates_numericality_of :score, :only_integer => true,
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 100,
    :message => "can only be whole number between 1 and 100 standing for a proportion over 100."

  validates :student_id, :uniqueness => {:scope => :exam_id}

  scope :find_by_assoc, -> (student, exam) { where( :student => student, :exam => exam ) }
  
  scope :find_total_for, -> (exam) { where( :exam => exam ) }

  scope :find_passing_for, -> (exam) { find_total_for(exam).where( score: exam.passing_score..100 ) }

  def passed?
    self.score >= self.exam.passing_score
  end 

end
