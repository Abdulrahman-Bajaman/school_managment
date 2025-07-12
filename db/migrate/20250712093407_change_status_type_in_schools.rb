class ChangeStatusTypeInSchools < ActiveRecord::Migration[8.0]
    def up
    # First, add a new integer column temporarily
    add_column :schools, :status_tmp, :integer

    # Migrate existing boolean data to integer (assuming true → 1, false → 0)
    School.reset_column_information
    School.find_each do |school|
      school.update_column(:status_tmp, school.status ? 1 : 0)
    end

    # Remove the old boolean column
    remove_column :schools, :status

    # Rename the new column to status
    rename_column :schools, :status_tmp, :status
  end

  def down
    # Reverse: change from integer back to boolean
    add_column :schools, :status_tmp, :boolean

    School.reset_column_information
    School.find_each do |school|
      school.update_column(:status_tmp, school.status == 1 ? true : false)
    end

    remove_column :schools, :status
    rename_column :schools, :status_tmp, :status
  end
end
