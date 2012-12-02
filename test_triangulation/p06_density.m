function density = p06_density ( m, n, point )

%*****************************************************************************80
%
%% P06_DENSITY returns the density for problem 06.
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
%    Input, real POINT(M,N), the coordinates of the points.
%
%    Output, real DENSITY(N), the mesh density at each point.
%
  density(1:n) = sqrt ( sqrt ( point(1,1:n).^4 + point(2,1:n).^4 ) );

  return
end
