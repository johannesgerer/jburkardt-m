function bg = ball_grid ( n, r, c, ng )

%*****************************************************************************80
%
%% BALL_GRID computes grid points inside a ball.
%
%  Discussion:
%
%    The grid is defined by specifying the radius and center of the ball,
%    and the number of subintervals N into which the horizontal radius
%    should be divided.  Thus, a value of N = 2 will result in 5 points
%    along that horizontal line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, real R, the radius of the ball.
%
%    Input, real C(3), the coordinates of the center of the ball.
%
%    Input, integer NG, the number of grid points, as determined by
%    BALL_GRID_COUNT.
%
%    Output, real BG(3,NG), the grid points inside the ball.
%
  bg = zeros ( 3, ng );

  p = 0;

  for i = 0 : n
    x = c(1) + r * 2 * i / ( 2 * n + 1 );
    
    for j = 0 : n
      y = c(2) + r * 2 * j / ( 2 * n + 1 );
      
      for k = 0 : n

        z = c(3) + r * 2 * k / ( 2 * n + 1 );

        if ( r * r < ( x - c(1) ).^2 ...
                   + ( y - c(2) ).^2 ...
                   + ( z - c(3) ).^2 )
          break
        end
        p = p + 1;
        bg(1:3,p) = [ x, y, z ]';
        if ( 0 < i )
          p = p + 1;
          bg(1:3,p) = [ 2 * c(1) - x, y, z ]';
        end
        if ( 0 < j )
          p = p + 1;
          bg(1:3,p) = [ x, 2 * c(2) - y, z ]';
        end
        if ( 0 < k )
          p = p + 1;
          bg(1:3,p) = [ x, y, 2 * c(3) - z ]';
        end
        if ( 0 < i && 0 < j )
          p = p + 1;
          bg(1:3,p) = [ 2 * c(1) - x, 2 * c(2) - y, z ]';
        end
        if ( 0 < i && 0 < k )
          p = p + 1;
          bg(1:3,p) = [ 2 * c(1) - x, y, 2 * c(3) - z ]';
        end
        if ( 0 < j && 0 < k )
          p = p + 1;
          bg(1:3,p) = [ x, 2 * c(2) - y, 2 * c(3) - z ]';
        end
        if ( 0 < i && 0 < j && 0 < k )
          p = p + 1;
          bg(1:3,p) = [ 2 * c(1) - x, 2 * c(2) - y, 2 * c(3) - z ]';
        end
      end
    end
  end

  return
end
