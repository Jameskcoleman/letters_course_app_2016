class CreateLetterAssignments < ActiveRecord::Migration
  def change
    create_table :letter_assignments do |t|
      t.integer :assignment_id, :letter_id
      t.timestamps
    end
  end
end
