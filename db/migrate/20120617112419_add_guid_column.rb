class AddGuidColumn < ActiveRecord::Migration
  def up
    change_column :videos, :views, null: false, default: 0
    Video.update_all(['views = ?', 0])
  end

  def down
    change_column :videos, :views
  end
end
