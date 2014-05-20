class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    strategy=["R","P","S"]
    raise NoSuchStrategyError,"Strategy must be one of R,P,S" unless strategy.include?(player2.at(1))
    return player1 if player1.at(1)==player2.at(1)
    case player1.at(1)
      when "R"
        return (player2.at(1)=="S")? player1:player2
      when "P"
        return (player2.at(1)=="R")? player1:player2
      when "S"
        return (player2.at(1)=="P")? player1:player2
      else
      raise NoSuchStrategyError,"Strategy must be one of R,P,S"
    end
  end

  def self.tournament_winner(tournament)
=begin
    branch=tournament
    while branch.class==Array
      puts branch.length
      branch=branch.at(0)
    end
=end
    if tournament.at(0).at(0).class==String
      return self.winner(tournament.at(0),tournament.at(1))
    else
      aux=Array.new
      tournament.each do |x|
          aux<< self.tournament_winner(x)
      end  
      if aux.at(0).class==String
        return aux
      else
        self.tournament_winner(aux)
      end
    end
    
  end

end
