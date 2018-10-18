# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#


  99.downto(0) do |n|
    Tiles.create(id: n, tile_type: "none")
  end

#movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#Character.create(name: 'Luke', movie: movies.first)
