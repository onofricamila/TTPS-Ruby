class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    drop_table :students
    
    create_table :students do |t|
      t.references :course, foreign_key: true
      t.string :surname
      t.string :name
      t.integer :number
      t.integer :dni
      t.string :email

      t.timestamps
    end
  end
end
