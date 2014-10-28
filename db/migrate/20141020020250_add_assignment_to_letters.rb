class AddAssignmentToLetters < ActiveRecord::Migration
  def change
    add_column :letters, :assignment, :string
  end
end
