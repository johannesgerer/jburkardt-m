function result = polygon_1_2d ( n, x, y )

%*****************************************************************************80
%
%% POLYGON_1_2D integrates the function 1 over a polygon in 2D.
%
%  Integration region:
%
%    The polygon bounded by the points (X(1:N), Y(1:N)).
%
%  Formula:
%
%    INTEGRAL = 0.5 * SUM ( 1 <= I <= N )
%      ( X(I) + X(I-1) ) * ( Y(I) - Y(I-1) )
%
%    where X(0) and Y(0) should be replaced by X(N) and Y(N).
%
%  Note:
%
%    The integral of 1 over a polygon is the area of the polygon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    S F Bockman,
%    Generalizing the Formula for Areas of Polygons to Moments,
%    American Mathematical Society Monthly,
%    1989, pages 131-132.
%
%  Parameters:
%
%    Input, integer N, the number of vertices of the polygon.
%    N should be at least 3 for a nonzero result.
%
%    Input, real X(N), Y(N), the coordinates of the vertices
%    of the polygon.  These vertices should be given in counter-clockwise order.
%
%    Output, real RESULT, the value of the integral.
%
  result = 0.0;

  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLYGON_1_2D - Warning!\n' );
    fprintf ( 1, '  The number of vertices must be at least 3.\n' );
    fprintf ( 1, '  The input value of N = %d\n', n );
    error ( 'POLYGON_1_2D - Fatal error!' );
  end

  for i = 1 : n

    if ( i == 1 )
      im1 = n;
    else
      im1 = i - 1;
    end

    result = result + 0.5 * ( x(i) + x(im1) ) * ( y(i) - y(im1) );

  end

  return
end
