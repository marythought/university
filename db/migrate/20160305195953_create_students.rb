class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :major
      t.string :gpa

      t.timestamps
    end
  end
end
