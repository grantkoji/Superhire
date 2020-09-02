class RemoveColumnAalignmentFromSuperheros < ActiveRecord::Migration[6.0]
  def change
    remove_column :superheros, :aalignment, :string
  end
end
