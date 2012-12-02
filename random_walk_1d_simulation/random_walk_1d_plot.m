function random_walk_1d_plot ( step_num )

%*****************************************************************************80
%
%% RANDOM_WALK_1D_PLOT plots 1 or more random walks in 1D.
%
%  Discussion:
%
%    The program takes a random walk in 1D, and plots the trajectory.
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

  plot ( [0, step_num], [0, 0], 'r-', 'LineWidth', 2 )
  hold on

  while ( 1 )

    walk_num = walk_num + 1;
    time = 0 : step_num;
    x = zeros(step_num+1,1);
%
%  Take a walk of STEP_NUM random +1 or -1 steps.
%
    for step = 1 : step_num

      r = rand ( );
%
%  Take the step.
%
      if ( r <= 0.5 )
        x(step+1) = x(step) - 1;
      else
        x(step+1) = x(step) + 1;
      end

    end
%
%  Plot the results.
%
    plot ( time, x, 'LineWidth', 1 );

    title_string = sprintf ( '1D Random Walk - %d walks, %d steps', walk_num, step_num );
    title ( title_string );
    xlabel ( 'Time' )
    ylabel ( 'Average X(T)' );

    c = input ( 'RETURN for another, or Q to quit.', 's' );

    if ( c == 'q' | c == 'Q' )
      break
    end

  end

  hold off

  return
end
