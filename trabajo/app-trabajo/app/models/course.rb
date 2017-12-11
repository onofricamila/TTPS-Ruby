class Course < ApplicationRecord
  has_many :exams, dependent: :destroy
  
  validates :year, 
    presence: true,
    uniqueness: true,
    inclusion: { in: 1990..Date.today.year ,message: "should be a year from 1990 to current"},
    format: { 
      with: /(19|20)\d{2}/i, 
      message: "should be a four-digit year"
    }
end
