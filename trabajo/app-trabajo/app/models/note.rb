class Note < ApplicationRecord
  belongs_to :exam
  # hay un problema que no se manda la nota
  belongs_to :student, :optional => true
end
