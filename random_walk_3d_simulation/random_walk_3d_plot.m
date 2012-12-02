function random_walk_3d_plot ( step_num )

%*****************************************************************************80
%
%% RANDOM_WALK_3D_PLOT plots 1 or more random walks in 3D.
%
%  Discussion:
%
%    The program takes a random walk in 3D, and plots the trajectory.
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
%    10 November 2009
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
  plot3 ( 0.0, 0.0, 0.0, 'ko', 'MarkerSize', 10 )
  grid on

  while ( 1 )

    walk_num = walk_num + 1;
    x = zeros(step_num+1,1);
    y = zeros(step_num+1,1);
    z = zeros(step_num+1,1);
%
%  Take a walk of STEP_NUM random steps.
%
   for step = 2 : step_num + 1
%
%  We are currently at ( X(STEP-1), Y(STEP-1) ).
%  Consider the possible points to step to.
%
      destination = [ x(step-1) + 1.0, y(step-1),       z(step-1); ...
                      x(step-1) - 1.0, y(step-1),       z(step-1); ...
                      x(step-1),       y(step-1) + 1.0, z(step-1); ...
                      x(step-1),       y(step-1) - 1.0, z(step-1); ...
                      x(step-1),       y(step-1),       z(step-1) + 1.0; ...
                      x(step-1),       y(step-1),       z(step-1) - 1.0 ];
%
%  Choose destination 1, 2, 3, 4, 5, or 6.
%
      k = ceil ( 6.0 * rand );
%
%  Move there.
%
      x(step) = destination(k,1);
      y(step) = destination(k,2);
      z(step) = destination(k,3);
 
      plot3 ( [ x(step-1), x(step) ], [ y(step-1), y(step) ], [ z(step-1), z(step) ], ...
        'r-', 'LineWidth', 1 );

    end

    plot3 ( x(step_num+1), y(step_num+1), z(step_num+1), 'r*', 'MarkerSize', 10 )
%
%  Plot the results.
%
    title_string = sprintf ( '3D Random Walk - %d walks, %d steps', walk_num, step_num );
    title ( title_string );
    xlabel ( 'X' )
    ylabel ( 'Y' );
    zlabel ( 'Z' );

    c = input ( 'RETURN for another, or Q to quit.', 's' );

    if ( c == 'q' | c == 'Q' )
      break
    end

    for step = 2 : step_num
      plot3 ( [ x(step-1), x(step) ], [ y(step-1), y(step) ], [ z(step-1), z(step) ], ...
        'b-', 'LineWidth', 1 );
    end
    plot3 ( x(step_num+1), y(step_num+1), z(step_num+1), 'k*', 'MarkerSize', 10 )

  end

  hold off

  return
end
