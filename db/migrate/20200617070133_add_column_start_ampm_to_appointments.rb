class AddColumnStartAmpmToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :start_ampm, :string
  end
end
