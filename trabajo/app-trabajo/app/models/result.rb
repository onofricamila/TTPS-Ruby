class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates_presence_of :student_id, :exam_id

  validate :correct_score
  
  validates :student_id, :uniqueness => {:scope => :exam_id}

  
  scope :find_total_for, -> (exam) { where( :exam => exam ).where.not(score: nil) }

  scope :find_by_assoc, -> (student, exam) { find_total_for(exam).where( :student => student) }

  scope :find_passing_for, -> (exam) { find_total_for(exam).where( score: exam.passing_score..100 ) }

  
  def passed?
    self.score != nil && (self.score >= self.exam.passing_score)
  end 

  def correct_score
    errors.add(:score, "can only be whole number between 0 and 100 standing for a proportion over 100.") if score.present? && !((0..100).include? score) 
  end

end
