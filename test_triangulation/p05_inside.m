function inside = p05_inside ( m, n, point )

%*****************************************************************************80
%
%% P05_INSIDE reports if a point is inside the region in problem 05.
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
  center1 = [  0.0, 0.0 ];
  center2 = [ -0.4, 0.0 ];
  r1 =   1.00;
  r2 =   0.55;

  inside(1:n) =                                                   ...
       center1(2) <=   point(2,1:n)                               ...
       &                                                          ...
                     ( point(1,1:n) - center1(1) ).^2             ...
                   + ( point(2,1:n) - center1(2) ).^2  <= r1 * r1 ...
       &                                                          ...
       r2 * r2 <=    ( point(1,1:n) - center2(1) ).^2             ...
                   + ( point(2,1:n) - center2(2) ).^2;


  return
end
