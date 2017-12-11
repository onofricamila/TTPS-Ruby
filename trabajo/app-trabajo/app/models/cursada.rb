class Cursada < ApplicationRecord
    validates :year, presence: true,
        uniqueness: true,
        inclusion: { in: 1990..Date.today.year },
        format: { 
         with:  /(19|20)\d{2}/i, 
         message: "should be a four-digit year"
        }
end
