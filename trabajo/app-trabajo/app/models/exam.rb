class Exam < ApplicationRecord
  belongs_to :course

  validates_presence_of :title, :date, :passing_score
 
end
