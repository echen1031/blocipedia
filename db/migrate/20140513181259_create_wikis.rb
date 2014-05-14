class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :name
      t.text :description
      t.boolean :public, :default => true

      t.timestamps
    end
  end
end
