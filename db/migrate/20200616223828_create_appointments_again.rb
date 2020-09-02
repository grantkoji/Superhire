class CreateAppointmentsAgain < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments_agains do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :description_of_service
      t.integer :customer_id
      t.integer :hrs_id, default: nil
      t.integer :superhero_id, default: nil 
    end
  end
end
