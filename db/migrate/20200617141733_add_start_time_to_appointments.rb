class AddStartTimeToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :start_time, :integer
  end
end
