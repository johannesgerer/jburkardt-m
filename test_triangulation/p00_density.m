function density = p00_density ( test, m, n, point )

%*****************************************************************************80
%
%% P00_DENSITY returns the density function for points in the region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test problem
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real POINT(M,N), the coordinates of the points.
%
%    Output, real DENSITY(M,N), the density function at the points.
%
  if ( test == 1 )
    density = p01_density ( m, n, point );
  elseif ( test == 2 )
    density = p02_density ( m, n, point );
  elseif ( test == 3 )
    density = p03_density ( m, n, point );
  elseif ( test == 4 )
    density = p04_density ( m, n, point );
  elseif ( test == 5 )
    density = p05_density ( m, n, point );
  elseif ( test == 6 )
    density = p06_density ( m, n, point );
  elseif ( test == 7 )
    density = p07_density ( m, n, point );
  elseif ( test == 8 )
    density = p08_density ( m, n, point );
  elseif ( test == 9 )
    density = p09_density ( m, n, point );
  elseif ( test == 10 )
    density = p10_density ( m, n, point );
  elseif ( test == 11 )
    density = p11_density ( m, n, point );
  elseif ( test == 12 )
    density = p12_density ( m, n, point );
  elseif ( test == 13 )
    density = p13_density ( m, n, point );
  elseif ( test == 14 )
    density = p14_density ( m, n, point );
  elseif ( test == 15 )
    density = p15_density ( m, n, point );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_DENSITY - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_DENSITY - Fatal error!' );
  end

  return
end
