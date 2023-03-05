class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :created_by
      t.integer :owner_id
      t.string :title
      t.string :description
      t.datetime :due_date
      t.string :status

      t.timestamps
    end
  end
end
