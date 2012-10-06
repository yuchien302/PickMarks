class AddSnapshotToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :snapshot, :string
  end
end
