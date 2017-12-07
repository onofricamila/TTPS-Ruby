class Office < ApplicationRecord
    has_many :employees

    scope :vacant, -> { where(office: nil) }
    scope :occupied, -> { where.not(office: nil) }

    validates :name, presence: true, length: { in: 1..255 }
    validates :available, exclusion: { in: [nil] }

    # validamos que el numero sea uno valido para arg
    validates :phone_number, presence: true, length: { in: 1..30 }, 
    format: { with: /(\(?\d{3}\)?[- .]?\d{4}[- .]?\d\d\d\d)|(\(?\d{4}\)?[- .]?\d{3}[- .]?\d\d\d\d)|(\(?\d{5}\)?[- .]?\d{2}[- .]?\d\d\d\d)/}
    

    
end
