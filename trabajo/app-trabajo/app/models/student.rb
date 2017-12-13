class Student < ApplicationRecord
  belongs_to :course
  has_many :results
  
  validates_presence_of :surname, :name, :dni, :number, :email
  validates_format_of :email, :with =>/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_format_of :surname, :name, :with =>/\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i 

  validates :dni, :uniqueness => {:scope => [:course_id]}
  validates :surname, :uniqueness => {:scope => [:course_id, :name]}
  validates :number, :uniqueness => {:scope => [:course_id]}

  def attended_to? exam
    !(Result.find_by_assoc(self, exam).empty?)
  end

  def score_for exam
   (Result.find_by_assoc self, exam).first
  end
end
