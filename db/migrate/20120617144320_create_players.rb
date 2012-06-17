class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    Player.create(name: 'Pablo', email: 'pablo.molinacandel@gmail.com')
  end
end
