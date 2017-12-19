class Student < ApplicationRecord
  has_many :results, :dependent => :restrict_with_error
  belongs_to :course
  
  validates_presence_of :surname, :name, :dni, :number, :email
  validates_format_of :email, :with =>/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_format_of :surname, :name, :with =>/\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i 

  validates_numericality_of :dni, :number, :only_integer => true,
    :greater_than_or_equal_to => 1

  validates :dni, :number, :email, :uniqueness => {:scope => [:course_id]}
  validates :name, :uniqueness => {:scope => [:course_id, :surname], message: "should be different, at least. There is someone in this course with that name and surname." }
  
  def to_s
    "#{surname}, #{name}"
  end

  def attended_to? exam
    !(Result.find_by_assoc(self, exam).empty?)
  end

  def score_for exam
   (Result.find_by_assoc self, exam).first
  end

  def surname_with_name
    "#{surname}, #{name}"
  end
end
