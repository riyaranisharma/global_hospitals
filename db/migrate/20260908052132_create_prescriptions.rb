class CreatePrescriptions < ActiveRecord::Migration[8.1]
  def change
    create_table :prescriptions do |t|

      t.references :doctor,
                   null: false,
                   foreign_key: { to_table: :users }

      t.references :patient,
                   null: false,
                   foreign_key: { to_table: :users }

      t.references :appointment,
                   null: true,
                   foreign_key: true

      t.text :diagnosis
      t.text :notes

      t.string :status,
               null: false,
               default: "active"

      t.timestamps
    end
  end
end