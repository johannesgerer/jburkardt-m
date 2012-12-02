function [ s, turn_average ] = duel_simulation ( p, duel_num )

%*****************************************************************************80
%
%% DUEL_SIMULATION simulates a duel.
%
%  Discussion:
%
%    Player 1 fires at player 2, and hits with a probability of P(1).
%    If Player 2 misses, then Player 2 fires at Player 1, hitting with
%    a probability of P(2).
%
%    The duel continues with alternating shots until only one player 
%    survives.
%
%    The simulation is intended to estimate the probabilities that a
%    player will survive, and the number of turns required.
%
%    The exact probability that player 1 will survive is
%
%      P(1) / ( P(1) + P(2) - P(1) * P(2) )
%
%    Player 2's chance is
%
%     P(2) * ( 1 - P(1) ) / ( P(1) + P(2) - P(1) * P(2) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
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
%    Input, real P(2), the probabilities that player I will hit an opponent
%    in a single shot.  Each P(I) should be between 0 and 1.
%
%    Input, integer DUEL_NUM, the number of duels to run.
%
%    Output, real S(2), the estimated probablity that player I will survive.
%
%    Output, real TURN_AVERAGE, the average number of turns required to
%    complete the duel.
%
  s = zeros(2,1);
  turn_average = 0;

  for duel = 1 : duel_num
    [ survivor, turn_num ] = duel_once ( p );
    s(survivor) = s(survivor) + 1;
    turn_average = turn_average + turn_num;
  end

  s = s / duel_num;
  turn_average = turn_average / duel_num;

  return
end
function [ survivor, turn_num ] = duel_once ( p )

%*****************************************************************************80
%
%% DUEL_ONCE returns the outcome of a single duel.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2009
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
%    Input, real P(2), the probabilities that player I will hit an opponent
%    in a single shot.  Each P(I) should be between 0 and 1.
%
%    Output, integer SURVIVOR, the survivor of the duel.
%
  turn_num = 0;
 
  while ( 1 )
%
%  Player 1 fires.
%
    turn_num = turn_num + 1;
    r = rand ( );
    if ( r <= p(1) )
      survivor = 1;
      break
    end
%
%  Player 2 fires.
%
    turn_num = turn_num + 1;
    r = rand ( );
    if ( r <= p(2) )
      survivor = 2;
      break
    end

  end

  return
end
