class AddStartingTimeToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :starting_time, :integer
  end
end
