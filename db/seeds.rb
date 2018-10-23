# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

snakes_hash = {
  17 => 7,
  54 => 34,
  62 => 18,
  64 => 60,
  87 => 24,
  93 => 73,
  95 => 75,
  99 => 78
}

ladders_hash = {
  4 => 14,
  9 => 31,
  20 => 38,
  28 => 84,
  40 => 59,
  63 => 81,
  71 => 91
}


  100.downto(1) do |n|
    if snakes_hash.include? n
      Tiles.create(id: n, tile_type: "negative", link_id: snakes_hash[n])
    elsif ladders_hash.include? n
      Tiles.create(id: n, tile_type: "positive", link_id: ladders_hash[n])
    else
      Tiles.create(id: n, tile_type: "none", link_id: 0)
    end
  end


#movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#Character.create(name: 'Luke', movie: movies.first)
