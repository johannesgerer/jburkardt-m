function [ s, turn_average ] = truel_simulation ( p, truel_num )

%*****************************************************************************80
%
%% TRUEL_SIMULATION simulates a truel (a 3-way duel).
%
%  Discussion:
%
%    Three players fight a three-sided duel, or "truel".
%
%    Player 1 chooses a target (player 2, player 3, or nobody), and fires.
%    If aimed at a player, he hits with a probability of P(1).
%
%    Then it is Player 2's turn, and Player 3's turn.
%
%    Play continues to alternate until there is only one survivor.
%
%    We will assume that the players play with the following strategy.
%
%    * The player with the highest accuracy will always aim at the player
%      with the next highest accuracy.
%    * The player with the medium accuracy will always aim at the player
%      with the highest accuracy; if that player is dead, then the player
%      will aim at the player with lowest accuracy.
%    * The player with lowest accuracy will aim at NO ONE, as long as
%      the other two players are both alive.  Once there is only one
%      opponent, he will aim at that opponent.  
%
%    With the probabilities ( 2/6, 4/6, 5/6), the weakest player has about 
%    a 70% chance of surviving, using this strategy.
%
%    With the probabilities ( 5/6, 4/6, 2/6), the weakest player has about
%    a 40% chance of surviving.
%
%
%    Although the program was written to simulate a 3-way duel, it can
%    handle duels with an arbitrary number of players.  It determines the number 
%    of players from the length of the P array.  Therefore, to play a duel with 
%    4 players, simply supply 4 numbers in P.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marc Kilgour, Steven Brams,
%    The Truel,
%    Mathematics Magazine,
%    Volume 70, Number 5, December 1997, pages 315-326.
%
%    Paul Nahin,
%    Duelling Idiots and Other Probability Puzzlers,
%    Princeton University Press, 2000,
%    ISBN13: 978-0691009797,
%    LC: QA273.N29.
%
%    Martin Shubik,
%    "Does the Fittest Necessarily Survive?",
%    in Readings in Game Theory and Political Behavior,
%    edited by Martin Shubik,
%    Doubleday, 1954,
%    LC: H61.S53.
%
%  Parameters:
%
%    Input, real P(*), the probabilities that player I will hit an opponent
%    in a single shot.  Each P(I) should be between 0 and 1.
%
%    Input, integer TRUEL_NUM, the number of truels to run.
%
%    Output, real S(*), the estimated probablity that player I will survive.
%
%    Output, real TURN_AVERAGE, the average number of turns required to
%    complete the truel.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUEL_SIMULATION\n' );
  fprintf ( 1, '  MATLAB version\n' );

  if ( nargin < 2 )
    truel_num = input ( 'Enter the number of truels to run: ' );
  end

  if ( nargin < 1 )
    p = input ( 'Enter player accuracies between 0 and 1, in a vector [*,*,*]: ' );
  end
 
  player_num = length ( p );

  s = zeros(player_num,1);
  turn_average = 0;

  for duel = 1 : truel_num
    [ survivor, turn_num ] = truel_once ( p );
    s(survivor) = s(survivor) + 1;
    turn_average = turn_average + turn_num;
  end

  s = s / truel_num;
  turn_average = turn_average / truel_num;

  return
end
function [ survivor, turn_num ] = truel_once ( p )

%*****************************************************************************80
%
%% TRUEL_ONCE returns the outcome of a single truel.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Martin Shubik,
%    “Does the Fittest Necessarily Survive?”,
%    in Readings in Game Theory and Political Behavior,
%    edited by Martin Shubik,
%    Doubleday, 1954,
%    LC: H61.S53.
%
%  Parameters:
%
%    Input, real P(*), the probabilities that player I will hit an opponent
%    in a single shot.  Each P(I) should be between 0 and 1.
%
%    Output, integer SURVIVOR, the survivor.
%
  player_num = length ( p );

  turn_num = 0;
 
  while ( 1 )

    for i = 1 : player_num
%
%  Use the P vector to keep track of who's alive, and who's worth
%  shooting at.  To avoid shooting yourself, temporarily zero your
%  own P value.
%
      if ( 0.0 < p(i) )
        turn_num = turn_num + 1;
        p_save = p(i);
        p(i) = 0.0;
        [ p_max, target ] = max ( p );
        r = rand ( );
        if ( r <= p_save )
          p(target) = 0.0;
          if ( sum ( p ) == 0.0 )
            survivor = i;
            return
          end
        end
        p(i) = p_save;
      end

    end

  end

  return
end
