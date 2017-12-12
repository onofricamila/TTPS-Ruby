class Student < ApplicationRecord
  belongs_to :course

  validates_presence_of :surname, :name, :dni, :number, :email
  validates_format_of :email, :with =>/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_format_of :surname, :name, :with =>/\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i 

end
