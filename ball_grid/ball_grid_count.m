function ng = ball_grid_count ( n, r, c )

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
%    Output, integer NG, the number of grid points inside the ball.
%
  ng = 0;

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
        ng = ng + 1;
        if ( 0 < i )
          ng = ng + 1;
        end
        if ( 0 < j )
          ng = ng + 1;
        end
        if ( 0 < k )
          ng = ng + 1;
        end
        if ( 0 < i && 0 < j )
          ng = ng + 1;
        end
        if ( 0 < i && 0 < k )
          ng = ng + 1;
        end
        if ( 0 < j && 0 < k )
          ng = ng + 1;
        end
        if ( 0 < i && 0 < j && 0 < k )
          ng = ng + 1;
        end
      end
    end
  end

  return
end
