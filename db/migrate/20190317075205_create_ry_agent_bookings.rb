class CreateRyAgentBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :ry_agent_bookings do |t|
      t.integer :ry_agent_id, foreign_key: true
      t.integer :railyatri_user_id, foreign_key: true
      t.integer :bus_trip_id, foreign_key: true
      t.integer :payment_transaction_id, foreign_key: true
      t.boolean :status,default: false
      t.string :booked_by
      t.float :booking_discount

      t.timestamps
    end
  end
end
