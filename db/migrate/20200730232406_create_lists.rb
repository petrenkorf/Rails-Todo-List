class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title, limit: 100
      t.boolean :public, default: false
      t.boolean :closed, default: false
      t.timestamps
    end

    add_reference :lists, :user, foreign_key: true
  end
end
