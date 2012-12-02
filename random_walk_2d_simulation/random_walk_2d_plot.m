function random_walk_2d_plot ( step_num )

%*****************************************************************************80
%
%% RANDOM_WALK_2D_PLOT plots 1 or more random walks in 2D.
%
%  Discussion:
%
%    The program takes a random walk in 2D, and plots the trajectory.
%    It uses "HOLD ON" to hold the screen.  If the user hits RETURN,
%    another random walk is taken and appears in the same plot.  This
%    continues until the user presses "Q".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer STEP_NUM, the number of steps to take in one test.
%
  walk_num = 0;
%
%  Clear the plotting frame.
%
  clf
  
  hold on
  plot ( 0.0, 0.0, 'ko', 'MarkerSize', 10 )
  grid on

  while ( 1 )

    walk_num = walk_num + 1;
    x = zeros(step_num+1,1);
    y = zeros(step_num+1,1);
%
%  Take a walk of STEP_NUM random steps.
%
   for step = 2 : step_num + 1
%
%  We are currently at ( X(STEP-1), Y(STEP-1) ).
%  Consider the four possible points to step to.
%
      destination = [ x(step-1) + 1.0, y(step-1); ...
                      x(step-1) - 1.0, y(step-1); ...
                      x(step-1),       y(step-1) + 1.0; ...
                      x(step-1),       y(step-1) - 1.0 ];
%
%  Choose destination 1, 2, 3 or 4.
%
      k = ceil ( 4.0 * rand );
%
%  Move there.
%
      x(step) = destination(k,1);
      y(step) = destination(k,2);
 
      plot ( [ x(step-1), x(step) ], [ y(step-1), y(step) ], 'r-', 'LineWidth', 1 );

    end

    plot ( x(step_num+1), y(step_num+1), 'r*', 'MarkerSize', 10 )
%
%  Plot the results.
%
    title_string = sprintf ( '2D Random Walk - %d walks, %d steps', walk_num, step_num );
    title ( title_string );
    xlabel ( 'X' )
    ylabel ( 'Y' );

    c = input ( 'RETURN for another, or Q to quit.', 's' );

    if ( c == 'q' | c == 'Q' )
      break
    end

    for step = 2 : step_num
      plot ( [ x(step-1), x(step) ], [ y(step-1), y(step) ], 'b-', 'LineWidth', 1 );
    end
    plot ( x(step_num+1), y(step_num+1), 'k*', 'MarkerSize', 10 )

  end

  hold off

  return
end
