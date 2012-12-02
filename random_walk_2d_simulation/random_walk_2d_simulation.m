function random_walk_2d_simulation ( step_num, walk_num )

%*****************************************************************************80
%
%% RANDOM_WALK_2D_SIMULATION simulates a random walk in 2D.
%
%  Discussion:
%
%    The expectation should be that, the average distance squared D^2 
%    is equal to the time, or number of steps N.
%
%    Or, equivalently
%
%      average ( D ) = sqrt ( N )
%
%    The program makes a plot of both the average and the maximum values
%    of D^2 versus time.  The maximum value grows much more quickly,
%    and that curve is much more jagged.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer STEP_NUM, the number of steps to take in one test.
%
%    Input, integer WALK_NUM, the number of walks to take.
%

%
%  Set up arrays for plotting.
%
  time = 0 : step_num;
  d2_ave = zeros(step_num+1,1);
  d2_max = zeros(step_num+1,1);
%
%  Take the walk WALK_NUM times.
%
  for walk = 1 : walk_num

    x = zeros(step_num+1,1);
    y = zeros(step_num+1,1);
  
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
%
%  Update the sum of every particle's distance at step J.
%
      d2 = x(step)^2 + y(step)^2;
      d2_ave(step) = d2_ave(step) + d2;
      d2_max(step) = max ( d2_max(step), d2 );
 
    end

  end
%
%  Average the squared distance at each step over all walks.
%
  d2_ave(:,1) = d2_ave(:,1) / walk_num;
%
%  Make a plot.
%
  clf
  plot ( time, d2_ave, time, d2_max, 'LineWidth', 2 );

  xlabel ( 'Time' )
  ylabel ( 'Distance squared' )
  title_string = sprintf ( '2D Random Walk Ave and Max - %d walks, %d steps', walk_num, step_num );
  title ( title_string );

  return
end
