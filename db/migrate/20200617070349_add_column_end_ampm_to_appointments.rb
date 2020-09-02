class AddColumnEndAmpmToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :end_ampm, :string
  end
end
