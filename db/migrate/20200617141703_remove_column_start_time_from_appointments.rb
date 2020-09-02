class RemoveColumnStartTimeFromAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :start_time, :time
  end
end
