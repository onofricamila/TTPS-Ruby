class Course < ApplicationRecord
  has_many :students, :dependent => :restrict_with_error
  has_many :exams, :dependent => :restrict_with_error
  
  validates :year, 
    presence: true,
    uniqueness: true,
    inclusion: { in: 1990..Date.today.year ,message: "should be a year from 1990 to current"},
    format: { 
      with: /(19|20)\d{2}/i, 
      message: "should be a four-digit year, starting with 19.. or 20.."
    }
end
