function cg = circle_grid ( n, r, c, ng )

%*****************************************************************************80
%
%% CIRCLE_GRID computes grid points inside a circle.
%
%  Discussion:
%
%    The grid is defined by specifying the radius and center of the circle,
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
%    Input, real R, the radius of the circle.
%
%    Input, real C(2), the coordinates of the center of the circle.
%
%    Input, integer NG, the number of grid points, as determined by
%    CIRCLE_GRID_COUNT.
%
%    Output, real CG(2,NG), the grid points inside the circle.
%
  cg = zeros ( 2, ng );

  p = 0;

  for j = 0 : n
    i = 0;
    x = c(1);
    y = c(2) + r * 2 * j / ( 2 * n + 1 );
    p = p + 1;
    cg(1:2,p) = [ x,            y ]';
    if ( 0 < j )
      p = p + 1;
      cg(1:2,p) = [ x, 2 * c(2) - y ]';
    end
    while ( 1 )
      i = i + 1;
      x = c(1) + r * 2 * i / ( 2 * n + 1 );
      if ( r * r < ( x - c(1) ).^2 + ( y - c(2) ).^2 )
        break
      end
      p = p + 1;
      cg(1:2,p) = [            x,            y ]';
      p = p + 1;
      cg(1:2,p) = [ 2 * c(1) - x ,           y ]';
      if ( 0 < j )
        p = p + 1;
        cg(1:2,p) = [            x, 2 * c(2) - y ]';
        p = p + 1;
        cg(1:2,p) = [ 2 * c(1) - x , 2 * c(2) - y ]';
      end
    end
  end

  return
end
