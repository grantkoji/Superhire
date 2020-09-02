class AddColumnAlignmentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :alignment, :string
  end
end
