function result = polygon_xy_2d ( n, v )

%*****************************************************************************80
%
%% POLYGON_XY_2D integrates the function X*Y over a polygon in 2D.
%
%  Discussion:
%
%    The polygon is bounded by the points (X(1:N), Y(1:N)).
%
%    INTEGRAL = (1/24) * sum ( 1 <= I <= N )
%      ( Y(I)   * ( 3 * X(I)**2 + 2 * X(I) * X(I-1) +     X(I-1)**2 )
%      + Y(I-1) * (     X(I)**2 + 2 * X(I) * X(I-1) + 3 * X(I-1)**2 ) )
%      * ( Y(I) - Y(I-1) )
%
%    where X(0) and Y(0) should be replaced by X(N) and Y(N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
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
%    Input, real V(2,N), the coordinates of the vertices
%    of the polygon.  These vertices should be given in
%    counter-clockwise order.
%
%    Output, real RESULT, the value of the integral.
%
  dim_num = 2;

  result = 0.0;

  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLYGON_XY_2D - Warning!\n' );
    fprintf ( 1, '  The number of vertices must be at least 3.\n' );
    fprintf ( 1, '  The input value of N = %d\n', n );
    return
  end

  for i = 1 : n

    if ( i == 1 )
      im1 = n;
    else
      im1 = i - 1;
    end

    result = result + ( ...
      v(2,i) * ( 3.0 * v(1,i).^2 + 2.0 * v(1,i) * v(1,im1) ...
      + v(1,im1).^2 ) + v(2,im1) * ( v(1,i).^2 + 2.0 * v(1,i) * v(1,im1) ...
      + 3.0 * v(1,im1).^2 ) ) * ( v(2,i) - v(2,im1) );

  end

  result = result / 24.0;

  return
end
