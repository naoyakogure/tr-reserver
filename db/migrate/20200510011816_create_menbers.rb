class CreateMenbers < ActiveRecord::Migration[5.2]
  def change
    create_table :menbers do |t|
      t.string :name
      t.integer :leader
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
