class GameDateToDatetime < ActiveRecord::Migration
  def up
    remove_column :games, :day
    add_column :games, :daytime, :datetime
  end

  def down
  end
end
