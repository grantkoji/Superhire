class ChangeColumnAlignmentInUsers < ActiveRecord::Migration[6.0]
  def down
    remove_column :users, :alignment, :integer
  end
end
