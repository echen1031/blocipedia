class RemoveWikiIdFromUserTable < ActiveRecord::Migration
  def up
    remove_column :users, :wiki_id
  end

  def down
  end
end
