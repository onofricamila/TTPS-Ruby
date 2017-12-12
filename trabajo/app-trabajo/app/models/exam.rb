class Exam < ApplicationRecord
  belongs_to :course

  validates_presence_of :title, :date, :passing_score

  validates :title, 
    uniqueness: true

  validates :passing_score, 
    inclusion: { in: 1..100 ,message: "should be a number between 1 and 100, representing a proportion"}
 
end
