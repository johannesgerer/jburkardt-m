function random_walk_avoid_2d_simulation ( step_num, walk_num )

%*****************************************************************************80
%
%% RANDOM_WALK_AVOID_2D_SIMULATION: multiple self-avoiding 2D walks.
%
%  Discussion:
%
%    The user gives a desired length and a desired number of walks,.  
%    The program tries to make this many randomly chosen self-avoiding walks
%    in 2D.  Very often, a given self-avoiding random walk will
%    come to a premature end, where it can take no further steps without
%    running into itself.
%
%    The program will keep track of the average of the distance squared
%    versus number of steps.
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
%    Input, integer WALK_NUM, the number of walks to take.
%
  time = 0 : step_num;
  d2 = zeros(step_num+1,1);
  walks = zeros(step_num+1,1);
%
%  Take a walk.
%
  for walk = 1 : walk_num

    x = 0;   
    y = 0;

    trajectory = zeros ( step_num + 1, 2 );                                                                  % the origin.
    trajectory(1,1:2) = [ x, y ];
    walks(1) = walks(1) + 1;

    for step = 1 : step_num    
%
%  There are four neighbors.
%
      neighbors = [ x + 1.0, y; ...
                    x - 1.0, y; ...
                    x,       y + 1.0; ...
                    x,       y - 1.0 ];
%
%  If a neighbor is listed in the trajectory, we can't go there.
%
      destination = setdiff ( neighbors, trajectory, 'rows' );
%
%  NROWS counts the remaining choices.
%
      [ nrows, ncols ] = size ( destination );
%
%  If we ran out of options, terminate this walk.
%
      if ( nrows == 0 )
        break
      end

      k = ceil ( nrows * rand ( ) );
      x = destination(k,1);
      y = destination(k,2);
%
%  Build up the trajectory.
%
      trajectory(step+1,1:2) = [ x, y ];
      walks(step+1) = walks(step+1) + 1;
%
%  Track the square of the distance at each step.
%
      d2(step+1) = d2(step+1) + x^2 + y^2;

    end
  end
%
%  Plot the number of steps versus the number of walks we were able to take
%  of that length.
%
  figure ( 1 )
  plot ( 0 : step_num, walks(1:step_num+1), 'm-', 'LineWidth', 2 )
  title ( 'Length versus number of walks found.' )
  xlabel ( 'Length in steps' )
  ylabel ( 'Number of walks found' )
%
%  Average the squared distance to the origin, as a function of the number
%  of steps, over all the walks that made it that far.
%
  d2(1:step_num+1) = d2(1:step_num+1) ./ walks(1:step_num+1);
%
%  Prepare for a log-log plot.
%
  for step = 1 : step_num
    d2_log(step) = log ( d2(step+1) );
    t_log(step) = log ( time(step+1) );
  end
%
%  Do a least-squares fit to the log-log data.
%
  c = polyfit ( t_log, d2_log, 1 );
%
%  Compute the least squares function.
%
  d2_log_fit = c(1) * t_log + c(2);

  figure ( 2 )
  plot ( t_log, d2_log, 'o', t_log, d2_log_fit )
  xlabel ( 'Time' );
  ylabel ( 'D^2' );
  title ( '<d^2> versus T for self-avoiding walk in 2D' )

  fprintf ( 1, '\n' );
  fprintf ( 'The least squares fit gives log(D2) = %g * log(T) + %g \n', c(:) )

  return
end
