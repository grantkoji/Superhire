class RemoveEndTimeFromAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :end_time, :time
  end
end
