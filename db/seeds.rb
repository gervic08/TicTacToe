# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

game1 = Game.create()
player1 = Player.create(name: "Player 1", game_id: game1.id)
player2 = Player.create(name: "Player 2", game_id: game1.id)
board1 = Board.create(game_id: game1.id) 
