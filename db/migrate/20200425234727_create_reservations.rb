class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.string :place
      t.string :course
      t.string :remarks
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
