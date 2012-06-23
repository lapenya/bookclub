class AddressFieldsVideos < ActiveRecord::Migration
  def up
    change_table :videos do |t|
      t.string :state
      t.string :country
      t.string :address
    end
  end

  def down
    remove_column :videos, :state
    remove_column :videos, :country
    remove_column :videos, :address
  end
end
