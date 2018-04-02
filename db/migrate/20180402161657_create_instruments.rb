class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.references :user, foreign_key: true
      t.string :city
      t.string :category
      t.string :name
      t.string :description
      t.string :photo
      t.integer :price
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
