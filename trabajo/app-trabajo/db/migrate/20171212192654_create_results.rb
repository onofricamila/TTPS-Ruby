class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :exam, foreign_key: true
      t.integer :score
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
