class MarkersGmapsAttrs < ActiveRecord::Migration
  def up
    change_table :videos do |t|
      t.string :latitude
      t.string :longitude
      t.string :content
    end
  end

  def down
    remove_column :videos, :latitude
    remove_column :videos, :longitude
    remove_column :videos, :content
  end
end
