class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :day
      t.string :ground
      t.string :rival

      t.timestamps
    end
  end
end
