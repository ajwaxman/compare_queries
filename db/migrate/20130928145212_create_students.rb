class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.references :classroom

      t.timestamps
    end
    add_index :students, :classroom_id
  end
end
