class CreatePrescriptionMedicines < ActiveRecord::Migration[8.1]
  def change
    create_table :prescription_medicines do |t|

      t.references :prescription,
                   null: false,
                   foreign_key: true

      t.string :medicine_name,
               null: false

      t.string :dosage,
               null: false

      t.string :frequency,
               null: false

      t.string :duration,
               null: false

      t.text :instructions

      t.timestamps
    end
  end
end