function inside = p10_inside ( m, n, point )

%*****************************************************************************80
%
%% P10_INSIDE reports if a point is inside the region in problem 10.
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
  x1 =  0.0;
  x2 = +1.0;
  y1 =  0.0;
  y2 = +1.0;

  inside(1:n) =                     ...
      x1 <=    point(1,1:n)       & ...
               point(1,1:n) <= x2 & ...
      y1 <=    point(2,1:n)       & ...
               point(2,1:n) <= y2;

  return
end
