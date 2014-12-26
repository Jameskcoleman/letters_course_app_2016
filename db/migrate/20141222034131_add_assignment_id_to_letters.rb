class AddAssignmentIdToLetters < ActiveRecord::Migration
  def change
    add_column :letters, :assignment_id, :integer
  end
end