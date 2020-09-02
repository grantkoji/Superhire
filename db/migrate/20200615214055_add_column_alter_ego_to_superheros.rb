class AddColumnAlterEgoToSuperheros < ActiveRecord::Migration[6.0]
  def change
    add_column :superheros, :alter_ego, :string
  end
end
