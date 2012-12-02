function random_walk_2d_avoid_plot ( step_num )

%*****************************************************************************80
%
%% RANDOM_WALK_2D_AVOID_PLOT plots a random self-avoiding walk.
%
%  Discussion:
%
%    The user gives a desired length, STEP_NUM.  The program tries to take
%    this many steps, but very often the self-avoiding random walk will
%    come to a premature end where it can take no further steps without
%    running into itself.
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
%  Reference:
%
%    Brian Hayes,
%    How To Avoid Yourself,
%    American Scientist,
%    Volume 86, Number 4, July-August 1998, pages 314-319.
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
%
%  Mark the origin.
%
  plot ( 0.0, 0.0, 'ko', 'MarkerSize', 10 )
  grid on
%
%  Take as many walks as the user wants to try.
%
  while ( 1 )

    walk_num = walk_num + 1;

    x = 0;   
    y = 0;

    trajectory = zeros ( step_num + 1, 2 );                                                                  % the origin.
    trajectory(1,1:2) = [ x, y ];

    step_length = step_num;
%
%  Take as many steps as the user specified.
%
    for step = 1 : step_num    
%
%  There are four neighbors of the current point (X,Y).
%
      neighbors = [ x + 1.0, y; ...
                    x - 1.0, y; ...
                    x,       y + 1.0; ...
                    x,       y - 1.0 ];
%
%  If a neighbor is already listed in the trajectory, we can't go there.
%
      destination = setdiff ( neighbors, trajectory, 'rows' );
%
%  NROWS counts the remaining choices.
%
      [ nrows, ncols ] = size ( destination );
%
%  If we ran out of choices, the walk has terminated early.
%
      if ( nrows == 0 )
        step_length = step - 1;
        break;
      end
%
%  Otherwise, choose a legal direction and take it.
%
      k = ceil ( nrows * rand ( ) );
      x = destination(k,1);
      y = destination(k,2);
%
%  Add the neighbor to the trajectory .
%
      trajectory(step+1,1:2) = [ x, y ];
%
%  Plot the step from the current position to the new one.
%
       plot ( [ trajectory(step,1), trajectory(step+1,1) ], ...
              [ trajectory(step,2), trajectory(step+1,2) ], 'r-', 'LineWidth', 2 );

    end
%
%  Mark the last position.
%
    if ( step_length == step_num )
      plot ( trajectory(step_length+1,1), trajectory(step_length+1,2), ...
        'r*', 'MarkerSize', 10 );
    else
      plot ( trajectory(step_length+1,1), trajectory(step_length+1,2), ...
        'bx', 'MarkerSize', 10 );
    end
%
%  Label the result.
%
    title_string = sprintf ( ...
      '2D Random Self-Avoiding Walk - %d walks, %d steps', walk_num, step_length );
    title ( title_string );
    xlabel ( 'X' );
    ylabel ( 'Y' );
%
%  Does the user want another try?
%
    c = input ( 'RETURN for another, or Q to quit.', 's' );

    if ( c == 'q' | c == 'Q' )
      break
    end
%
%  Before drawing the next walk, erase the thick line of the current trajectory,
%  and redraw with a thin blue line.
%
    for step = 1 : step_length
       plot ( [ trajectory(step,1), trajectory(step+1,1) ], ...
              [ trajectory(step,2), trajectory(step+1,2) ], 'w-', 'LineWidth', 2 );
       plot ( [ trajectory(step,1), trajectory(step+1,1) ], ...
              [ trajectory(step,2), trajectory(step+1,2) ], 'b-', 'LineWidth', 1 );
    end
%
%  Also redraw the marker at the last position.
%
    if ( step_length == step_num )
      plot ( trajectory(step_length+1,1), trajectory(step_length+1,2), 'k*', 'MarkerSize', 10 )
    else
      plot ( trajectory(step_length+1,1), trajectory(step_length+1,2), 'kx', 'MarkerSize', 10 )
    end

  end

  hold off

  return
end
