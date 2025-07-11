class CreateSchoolTable < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name_en, limit: 100, null: false
      t.string :name_ar, limit: 100, null: false
      t.string :address
      t.integer :status, null: false
      t.timestamps
    end

    add_index :schools, :name_en, unique: true
    add_index :schools, :name_ar, unique: true
  end
end
