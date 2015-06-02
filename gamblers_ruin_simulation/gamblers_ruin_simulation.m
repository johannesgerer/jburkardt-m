function gamblers_ruin_simulation ( a_stakes, b_stakes, game_num )

%*****************************************************************************80
%
%% GAMBLERS_RUIN_SIMULATION simulates the game of gambler's ruin.
%
%  Discussion:
%
%    Two players, A and B, repeatedly toss a coin.  
%    For heads, A wins one dollar from B;
%    For tails, B wins one dollar from A.
%    Play continues until one player is bankrupt.
%
%    This program "plays" the game GAME_NUM times, always starting from
%    the same initial configuration.
%
%    it keeps track of the number of coin tosses required, the number
%    of times the lead changes, and the number of times each player wins.
%
%    At the end, it prints some statistics, and plots histograms of the
%    length of the game, and the number of lead changes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A_STAKES, B_STAKES, the number of dollars that A and
%    B have initially.
%
%    Input, integer GAME_NUM, the number of games to simulate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAMBLERS_RUIN_SIMULATION\n' );
  fprintf ( 1, '  MATLAB version\n' );

  if ( nargin < 1 )
    a_stakes = input ( 'Enter A_STAKES: ' );
  else
    a_stakes = str2num ( a_stakes );
  end

  if ( nargin < 2 )
    b_stakes = input ( 'Enter B_STAKES: ' );
  else
    b_stakes = str2num ( b_stakes );
  end

  if ( nargin < 3 )
    game_num = input ( 'Enter GAME_NUM, the number of games to play: ' );
  else
    game_num = str2num ( game_num );
  end

  a_wins = 0;
  b_wins = 0;
%
%  Play GAME_NUM games.
%
  for game = 1 : game_num

    step_num = 0;
    leader = '0';
    flip_num = -1;
    a = a_stakes;
    b = b_stakes;

    while ( 0 < a & 0 < b )

      step_num = step_num + 1;

      r = rand ( );
 
      if ( r <= 0.5 )
        a = a + 1;
        b = b - 1;
      else
        a = a - 1;
        b = b + 1;
      end

      if ( a_stakes < a & leader ~= 'A' )
        leader = 'A';
        flip_num = flip_num + 1;
      elseif ( a < a_stakes & leader ~= 'B' )
        leader = 'B';
        flip_num = flip_num + 1;
      end

    end

    if ( b == 0 ) 
      a_wins = a_wins + 1;
    else
      b_wins = b_wins + 1;
    end

    flip(game) = flip_num;
    step(game) = step_num;

  end
%
%  Average over the number of games.
%
  step_ave = sum ( step(1:game_num) ) / game_num;
  prob_a_win = a_wins / game_num;
  prob_b_win = b_wins / game_num;
%
%  Print statistics.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of games in simulation = %d\n', game_num );
  fprintf ( 1, '  A starts game with %d\n', a_stakes );
  fprintf ( 1, '  B starts game with %d\n', b_stakes );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average number of steps = %f\n', step_ave );
  fprintf ( 1, '  Expected number of steps = %d\n', a_stakes * b_stakes );
  fprintf ( 1, '  Maximum number of steps = %d\n', max ( step ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average chance of A winning = %f\n', prob_a_win );
  fprintf ( 1, '  Expected chance of A winning = %f\n', a_stakes / ( a_stakes + b_stakes ) );
  fprintf ( 1, '  Average chance of B winning = %f\n', prob_b_win );
  fprintf ( 1, '  Expected chance of B winning = %f\n', b_stakes / ( a_stakes + b_stakes ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average number of flips = %f\n', sum ( flip ) / game_num );
  fprintf ( 1, '  Maximum number of flips = %d\n', max ( flip ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial flip table:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number Freq Prob\n' );
  fprintf ( 1, '\n' );
  for flip_num = 0 : 10
    i = find ( flip == flip_num );
    k = length ( i );
    fprintf ( 1, '  %4d  %6d  %f\n', flip_num, k, k / game_num );
  end
%
%  Plot steps.
%
  figure ( 1 )

  hist ( step, 40 )

  title ( 'Gambler''s ruin, number of steps' )
  xlabel ( 'Steps' )
  ylabel ( 'Frequency' )

  figure ( 2 )

  hist ( flip, 40 )
  title ( 'Gambler''s ruin, number of changes in the lead (flips)' )
  xlabel ( 'Flips' )
  ylabel ( 'Frequency' )

  return
end





