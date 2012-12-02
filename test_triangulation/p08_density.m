function density = p08_density ( m, n, point )

%*****************************************************************************80
%
%% P08_DENSITY returns the density for problem 08.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real POINT(M,N), the coordinates 
%    of the points.
%
%    Output, real DENSITY(N), the mesh density at 
%    each point.
%
  for j = 1 : n

    x = point(1,j);
    y = point(2,j);

    h1 = 0.005 + 0.2 *   sqrt (   x.^2         + y.^2 );
    h2 = 0.02  + 0.2 * ( sqrt ( ( x - 0.6 ).^2 + y.^2 ) - 1.0 );
    h3 = 0.005 + 0.2 *   sqrt ( ( x - 0.9 ).^2 + y.^2 );

    density(j) = min ( min ( min ( h1, h2 ), h3 ), 0.03 );

  end

  return
end
