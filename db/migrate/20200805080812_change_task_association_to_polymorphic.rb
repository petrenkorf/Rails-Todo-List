class ChangeTaskAssociationToPolymorphic < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :list_id
    change_table :tasks do |t|
      t.references :taskable, polymorphic: true
    end
  end
end
