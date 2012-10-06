class ChangeSnapshotToBookmarks < ActiveRecord::Migration
  def change
    change_column :bookmarks, :snapshot, :text
  end

end
