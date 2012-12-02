function inside = p06_inside ( m, n, point )

%*****************************************************************************80
%
%% P06_INSIDE reports if a point is inside the region in problem 06.
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
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real POINT(M,N), the coordinates of the points.
%
%    Output, logical INSIDE(N), is TRUE if the point is in the region.
%
  r1 = 1.0;
  r2 = 0.5;

  inside(1:n) = ( point(1,1:n).^4 + point(2,1:n).^4 <= r1^4 ) & ...
        ( r2^4 <= point(1,1:n).^4 + point(2,1:n).^4 );

  return
end
