function pg = pyramid_unit_grid ( n, ng )

%*****************************************************************************80
%
%% PYRAMID_UNIT_GRID computes grid points in the unit pyramid.
%
%  Discussion:
%
%    The unit pyramid has base (-1,-1,0), (+1,1,0), (+1,+1,0), (-1,+1,0)
%    and vertex (0,0,1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, real NG, the number of nodes to generate,
%    as determined by pyramid_grid_size().
%
%    Output, real PG(3,NG), the grid point coordinates.
%
  pg = zeros ( 3, ng );

  g = 0;

  for k = n : - 1 : 0
    hi = n - k;
    lo = - hi;
    for j = lo : 2 : hi
      for i = lo : 2 : hi
        g = g + 1;
        pg(1,g) = i / n;
        pg(2,g) = j / n;
        pg(3,g) = k / n;
      end
    end
  end

  return
end