class AddGuidColumn < ActiveRecord::Migration
  def up
    change_table :videos do |t|
      t.string :guid
    end
  end

  def down
    remove_column :videos, :guid
  end
end
