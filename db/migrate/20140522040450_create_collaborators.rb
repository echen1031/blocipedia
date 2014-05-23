class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :user
      t.belongs_to :wiki

      t.timestamps
    end
  end
end
