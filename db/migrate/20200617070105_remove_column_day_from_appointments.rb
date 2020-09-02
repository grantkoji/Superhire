class RemoveColumnDayFromAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :day, :string
  end
end
