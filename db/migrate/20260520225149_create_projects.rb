class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name
      t.text :goal
      t.date :deadline
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
