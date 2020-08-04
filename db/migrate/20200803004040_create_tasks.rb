class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :closed, default: false
      t.timestamps
    end

    add_reference :tasks, :list, foreign_key: true
  end
end
