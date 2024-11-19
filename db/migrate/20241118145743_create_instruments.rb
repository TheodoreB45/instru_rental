class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.text :description
      t.string :condition
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
