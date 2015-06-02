function ng = disk_grid_count ( n, r, c )

%*****************************************************************************80
%
%% DISK_GRID_COUNT counts the grid points inside a disk.
%
%  Discussion:
%
%    The grid is defined by specifying the radius and center of the disk,
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
%    Input, real R, the radius of the disk.
%
%    Input, real C(2), the coordinates of the center of the disk.
%
%    Output, integer NG, the number of grid points inside the disk.
%
  ng = 0;

  for j = 0 : n
    i = 0;
    x = c(1);
    y = c(2) + r * 2 * j / ( 2 * n + 1 );
    ng = ng + 1;
    if ( 0 < j )
      ng = ng + 1;
    end
    while ( 1 )
      i = i + 1;
      x = c(1) + r * 2 * i / ( 2 * n + 1 );
      if ( r * r < ( x - c(1) ).^2 + ( y - c(2) ).^2 )
        break
      end
      ng = ng + 1;
      ng = ng + 1;
      if ( 0 < j )
        ng = ng + 1;
        ng = ng + 1;
      end
    end
  end

  return
end
