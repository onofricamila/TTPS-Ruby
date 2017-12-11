class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string :title
      t.integer :passing_score
      t.date :date
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
