require 'rspec'
require 'rspec/its'
require_relative '../team_players.rb'

describe "Clases" do

  context "check results" do
    player1 = Player.new("Bob", 13, 5)
    player2 = Player.new("Jim", 15, 4.5)
    player3 = Player.new("Mike", 21, 5)
    player4 = Player.new("Joe", 14, 5)
    player5 = Player.new("Scott", 16, 3)

    red_team = Team.new("Red")
    red_team.add_players(player1, player2, player3, player4, player5)

  
    elig_players = red_team.select { |team| team.age>=14 and team.age<= 20 and team.skill_level >= 4.5 }
    puts elig_players

    it "resultado de busqueda inesperado" do
      expect(elig_players.size).to be == 2
    end
  end

  context "verificando propiedades de instancia" do
    subject(:john) { Player.new("Raquel", 14 , 5) }

    it "missing name" do
      is_expected.to respond_to(:name)
    end

    it "missing skill_level" do
      is_expected.to respond_to(:age)
    end

    it "missing age" do
      is_expected.to respond_to(:skill_level)
    end
  end

  context "verificando propiedades de clase" do
    subject(:class) { Team }

    it "missing search" do
      is_expected.to respond_to(:teams_quantity)
    end
  end
end
