function dice_simulation ( throw_num, die_num )

%*****************************************************************************80
%
%% DICE_SIMULATION simulates the repeated tossing and summing of M dice.
%
%  Usage:
%
%    dice_simulation ( throw_num, die_num )
%
%    where
%
%    * throw_num is the number of times the dice were thrown;
%    * die_num is the number of dice tossed each time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer THROW_NUM, the number of times the dice are thrown.
%
%    Input, integer DIE_NUM, the number of dice.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DICE_SIMULATION:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Simulate the throwing and totaling of M dice.\n' );
%
%  Get THROW_NUM.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    throw_num = input ( 'Enter number of throws: ' );
  elseif ( ischar ( throw_num ) )
    throw_num = str2num ( throw_num );
  end
%
%  Get DIE_NUM.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    die_num = input ( 'Enter number of dice: ' );
  elseif ( ischar ( die_num ) )
    die_num = str2num ( die_num );
  end
%
%  Throw all the dice, all the times.
%
  throws = rand ( throw_num, die_num );
%
%  Round up each die to the values 1, 2, 3, 4, 5, 6.
%
  throws = ceil ( 6 * throws );
%
%  Total the dice in each throw.
%
  score(1:throw_num) = sum ( throws(1:throw_num,1:die_num), 2 );
%
%  Make a frequency plot.
%
  x = linspace ( die_num, die_num*6, die_num*5+1 );

  hist ( score, x )

  xlabel ( 'Score' )
  ylabel ( 'Frequency' )
  title_string = sprintf ( 'Frequency plot for %d throws of %d dice', throw_num, die_num );
  title ( title_string );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press return for estimated probability plot.\n' );
  pause
%
%  Make an estimated probability plot.
%
  x = linspace ( die_num, die_num*6, die_num*5+1 );
  y = zeros ( die_num*5+1,1);
  for i = die_num : die_num*6
    j = find ( score == i );
    y(i-die_num+1) = length ( j ) / throw_num;
  end 

  bar ( x, y )

  xlabel ( 'Score' )
  ylabel ( 'Estimated Probability' )
  title_string = sprintf ( 'Probability estimates for %d throws of %d dice', ...
    throw_num, die_num );
  title ( title_string );
%
%  Statistics.
%
  score_ave = sum ( score(1:throw_num) ) / throw_num;
  score_var = var ( score );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of dice = %d\n', die_num );
  fprintf ( 1, '  Number of throws = %d\n', throw_num );
  fprintf ( 1, '  Maximum possible score = %d\n', 6 * die_num );
  fprintf ( 1, '  Average score =          %f\n', score_ave );
  fprintf ( 1, '  Minimum possible score = %d\n', die_num );
  fprintf ( 1, '  Variance of score = %f\n', score_var );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DICE_SIMULATION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
