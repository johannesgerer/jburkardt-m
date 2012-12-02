function [ step_num, dist ] = walk_task ( step_max, seed )

%*****************************************************************************80
%
%% WALK_TASK: compute a self-avoiding 2D walk.
%
%  Discussion:
%
%    The user gives a desired length and a seed for the random number generator.
%    The program tries to make ta randomly defined self-avoiding walk
%    in 2D of the given length.  The actual number of steps that were taken
%    is returned as program output.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2010
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
%    Input, integer STEP_MAX, the maximum number of steps to take.
%    (We actually can take 1 to STEP_MAX+1 steps).
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer STEP_NUM, the actual number of steps taken.
%
%    Output, real DIST, the distance of the final point from the origin.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WALK_TASK:\n' );
  fprintf ( 1, '  Take random walks, starting with seed %d\n', seed );
%
%  Use SEED to initialize the state of the random number generator.
%
  rand ( 'twister', seed );
%
%  Initialize the data.
%
  trajectory = zeros ( step_max + 1, 2 );
%
%  Start the walk at the origin.
%
  step_num = 1;

  x = 0.0;
  y = 0.0;
  trajectory(step_num,1:2) = [ x, y ];
  dist = sqrt ( x^2 + y^2 );

  for step_num = 2 : step_max + 1
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
%
%  Otherwise, choose an unvisited neighbor at random.
%
    k = ceil ( nrows * rand ( ) );

    x = destination(k,1);
    y = destination(k,2);
    trajectory(step_num,1:2) = [ x, y ];
    dist = sqrt ( x^2 + y^2 );

  end

  return
end
