class AddDateToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :date, :integer,  after: :id
  end
end
