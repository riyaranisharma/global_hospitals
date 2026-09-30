class CreateTestResults < ActiveRecord::Migration[8.1]
  def change
    create_table :test_results do |t|
      t.references :medical_report, null: false, foreign_key: true
      t.string :test_name
      t.string :result
      t.string :unit
      t.string :reference_range
      t.string :status

      t.timestamps
    end
  end
end
