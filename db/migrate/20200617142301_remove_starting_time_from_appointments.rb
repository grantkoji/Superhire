class RemoveStartingTimeFromAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :starting_time, :integer
  end
end
