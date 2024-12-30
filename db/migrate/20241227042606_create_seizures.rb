class CreateSeizures < ActiveRecord::Migration[8.0]
  def change
    create_table :seizures do |t|
      t.belongs_to :person, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
