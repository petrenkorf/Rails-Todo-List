class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.timestamps
    end

    add_belongs_to :bookmarks, :user
    add_belongs_to :bookmarks, :list
  end
end
