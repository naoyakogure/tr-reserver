class RemoveDateFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :date, :datetime
  end
end
