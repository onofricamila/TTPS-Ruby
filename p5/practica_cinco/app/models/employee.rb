class Employee < ApplicationRecord
    belongs_to :office

    validates :name, presence: true, length: { in: 1..150 }
    validates :e_number, presence: true, uniqueness: true

end
