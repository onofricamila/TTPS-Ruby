class CreateExams < ActiveRecord::Migration[5.1]
  def change
    drop_table :exams
    create_table :exams do |t|
      t.references :course, foreign_key: true
      t.string :title
      t.integer :passing_score
      t.date :date

      t.timestamps
    end
  end
end
