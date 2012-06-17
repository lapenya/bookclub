class InsertPlayers < ActiveRecord::Migration
  def change
    Player.create(name: 'Abel', email: 'abelfernandeztorres@hotmail.com')
    Player.create(name: 'Edu', email: 'duduworks@hotmail.com')
    Player.create(name: 'Negro', email: 'atresbandas@yahoo.es')
    Player.create(name: 'Dani', email: 'danivieldv@gmail.com')
    Player.create(name: 'Paco', email: 'garciaverde@gmail.com')
    Player.create(name: 'Oscar', email: 'oscar.hernandez@gmx.net')
    Player.create(name: 'Raul', email: 'elhombrequenoduerme@yahoo.es')
    Player.create(name: 'Jaime', email: 'jaimegrino@gmail.com')
    Player.create(name: 'David', email: 'davidmejia83@hotmail.com')
    Player.create(name: 'Fede', email: 'federicoemail1@gmail.com')
    Player.create(name: 'Negro', email: 'atresbandas')
  end
end
