function inside = p00_inside ( test, m, n, point )

%*****************************************************************************80
%
%% P00_INSIDE reports if a point is inside the region in a problem.
%
%  Discussion:
%
%    For argument's sake, a point on the boundary can be considered
%    inside the region, but it is probably futile to attempt to distinguish
%    this case in general.  For more information about a point's location,
%    use P00_SDIST.
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
%    Output, logical INSIDE(N), is TRUE if the point is in the region.
%
  if ( test == 1 )
    inside = p01_inside ( m, n, point );
  elseif ( test == 2 )
    inside = p02_inside ( m, n, point );
  elseif ( test == 3 )
    inside = p03_inside ( m, n, point );
  elseif ( test == 4 )
    inside = p04_inside ( m, n, point );
  elseif ( test == 5 )
    inside = p05_inside ( m, n, point );
  elseif ( test == 6 )
    inside = p06_inside ( m, n, point );
  elseif ( test == 7 )
    inside = p07_inside ( m, n, point );
  elseif ( test == 8 )
    inside = p08_inside ( m, n, point );
  elseif ( test == 9 )
    inside = p08_inside ( m, n, point );
  elseif ( test == 10 )
    inside = p10_inside ( m, n, point );
  elseif ( test == 11 )
    inside = p11_inside ( m, n, point );
  elseif ( test == 12 )
    inside = p12_inside ( m, n, point );
  elseif ( test == 13 )
    inside = p13_inside ( m, n, point );
  elseif ( test == 14 )
    inside = p14_inside ( m, n, point );
  elseif ( test == 15 )
    inside = p15_inside ( m, n, point );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_INSIDE - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_INSIDE - Fatal error!' );
  end

  return
end
