class RenameCollaboratorTable < ActiveRecord::Migration
  def self.up
    rename_table :collaborators, :sharedwikis
  end

  def self.down
    rename_table :sharedwikis, :collaborators
  end
end
