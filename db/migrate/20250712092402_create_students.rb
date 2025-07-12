class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :full_name, null: false
      t.integer :status, null: false
      t.references :school, null: false, foreign_key: {on_delete: :cascade}
      t.date :date_of_birth, null: false
      t.string :address, null: false
      t.string :phone_number, null:false

      t.timestamps
    end
  end
end
