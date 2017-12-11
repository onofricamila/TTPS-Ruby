class CreateCursadas < ActiveRecord::Migration[5.1]
  def change
    create_table :cursadas do |t|
      t.integer :year

      t.timestamps
    end
  end
end
