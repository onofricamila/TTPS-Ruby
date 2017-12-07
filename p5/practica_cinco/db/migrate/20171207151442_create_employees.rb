class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name, limit: 150, null: false
      t.string :e_number, null: false, unique: true
      # clave foranea
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
