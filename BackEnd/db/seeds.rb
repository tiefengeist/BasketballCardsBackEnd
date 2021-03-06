# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTParty.get('https://www.balldontlie.io/api/v1/players?per_page=4000')
players = response.first[1]

# def seeder(data)
#   data ? data.map { |player| Player.create(id: player["id"], first_name: player["first_name"], last_name: player["last_name"], weight_pounds: player["weight_pounds"], height_feet: player["height_feet"], height_inches: player["height_inches"], team_name: player["team"]["full_name"], position: player["position"])} : nil
# end

def seedImages
  players = Player.all

  players.each do |player|
    url = "https://nba-players.herokuapp.com/players/#{player.last_name}/#{player.first_name}"
    encoded_url = URI.encode(url)
    if HTTParty.get(URI.parse(encoded_url)).include?('Sorry')
      player.update(img: nil)
    else
      player.update(img: URI.parse(encoded_url))
  end
    # img ?  nil : (playervar.img = img)
  end
end





Player.seeder(players);
seedImages()
