class RyAgentBooking < ApplicationRecord
  belongs_to :user
  belongs_to :railyatri_user
  belongs_to :bus_trip
  belongs_to :payment_transaction
end
