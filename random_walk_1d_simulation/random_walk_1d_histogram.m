function random_walk_1d_histogram ( walker_num )

%*****************************************************************************80
%
%% RANDOM_WALK_1D_HISTOGRAM makes a histogram of multiple random walkers.
%
%  Discussion:
%
%    The program takes a given number of walkers who start at 0, allows each
%    walker to take one rando step and then displays  histogram of the results,
%    that is, it shows where each walker is.  The user can hit return and
%    see a histogram of the next result, indefinitely.
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
%  Parameters:
%
%    Input, integer WALKER_NUM, the number of walkers.
%

%
%  Clear the plotting frame.
%
  clf
%
%  X stores the location of each walker.
%
  x = zeros(walker_num,1);

  step_num = 0;

  while ( 1 )
%
%  Ask HIST for one bin for each X value from MIN(X) to MAX(X).
%
    min_x = min ( x );
    max_x = max ( x );
    bin_num = min ( max_x - min_x + 1, 101 );
%
%  Make the histogram and annotate it.
%
    hist ( x, bin_num );
 
    title_string = sprintf ( '1D Random Walkers - %d walkers, %d steps', walker_num, step_num );
    title ( title_string );
    xlabel ( 'X' )
    ylabel ( 'Number of walkers' );

    c = input ( 'RETURN for another, or Q to quit.', 's' );

    if ( c == 'q' | c == 'Q' )
      break
    end

    step_num = step_num + 1;

    x(1:walker_num) = x(1:walker_num) + 2 * floor ( 2 * rand (walker_num,1) ) - 1;

  end

  hold off

  return
end
