class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.references :course, foreign_key: true
      t.string :apellido
      t.string :nombre
      t.integer :legajo
      t.integer :dni
      t.string :email

      t.timestamps
    end
  end
end
