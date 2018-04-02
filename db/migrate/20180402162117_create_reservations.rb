class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :instrument, foreign_key: true
      t.string :message
      t.date :start_date
      t.date :end_date
      t.integer :total_price
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
