function gamblers_ruin_plot ( a_stakes, b_stakes )

%*****************************************************************************80
%
%% GAMBLERS_RUIN_PLOT plots a game of gambler's ruin.
%
%  Discussion:
%
%    Two players, A and B, repeatedly toss a coin.  
%    For heads, A wins one dollar from B;
%    For tails, B wins one dollar from A.
%    Play continues until one player is bankrupt.
%
%    The program simulates the game, and then produces a plot of the
%    amount of money that A has at each stage of the game.  At the end,
%    A must have either nothing or all the money.
%
%    The program produces a plot of A's money.  It also displays the
%    initial stakes, the number of steps, and the number of times the
%    lead changed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2009
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAMBLERS_RUIN_PLOT\n' );
  fprintf ( 1, '  MATLAB version\n' );

  step_num = 0;
  leader = '0';
  flip_num = -1;
  a = a_stakes;
  b = b_stakes;
  value(1) = a;

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

    fprintf ( 1, ' %d %d\n', a, b );
    value(step_num+1) = a;

    if ( a_stakes < a & leader ~= 'A' )
      leader = 'A';
      flip_num = flip_num + 1;
    elseif ( a < a_stakes & leader ~= 'B' )
      leader = 'B';
      flip_num = flip_num + 1;
    end

  end
%
%  Plot the results.
%
  clf
  hold on
  plot ( [ 0, step_num], [ a_stakes, a_stakes ], 'r-', 'LineWidth', 2 );
  plot ( [ 0, step_num], [ 0, 0 ], 'r-', 'LineWidth', 2 );
  plot ( [ 0, step_num], [ a_stakes + b_stakes, a_stakes + b_stakes ], 'r-', 'LineWidth', 2 );

  steps = 0 : step_num;
  plot ( steps, value, 'b-', 'LineWidth', 2 );

  title_string = sprintf ( 'Gambler''s Ruin - A = %d, B = %d, Steps = %d, Flips = %d', ...
    a_stakes, b_stakes, step_num, flip_num );

  title ( title_string );
  xlabel ( 'Coin Tosses' )
  ylabel ( 'A''s Money' );
  axis tight

  hold off

  return
end
