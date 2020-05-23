class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :date
      t.string :place
      t.string :course
      t.string :remarks
      t.references :user, foreign_key: true
      t.references :calendar, foreign_key: true

      t.timestamps
      t.index [:user_id, :calendar_id], unique: true
    end
  end
end
