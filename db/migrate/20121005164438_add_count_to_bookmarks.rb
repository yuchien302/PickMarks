class AddCountToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :count, :integer, default: 0
  end
end
