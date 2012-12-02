function inside = p13_inside ( m, n, point )

%*****************************************************************************80
%
%% P13_INSIDE reports if a point is inside the region in problem 13.
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
  inside(1:n) =                                           ...
       ( 45.0 <= point(1,1:n) & point(1,1:n) <= 55.0 &    ...
         30.0 <= point(2,1:n) & point(2,1:n) <= 90.0    ) ...
    |                                                     ...
       ( 900.0 <=                                         ...
         ( point(1,1:n) - 50.0 ).^2                       ...
       + ( point(2,1:n) -  0.0 ).^2 &                     ...
         ( point(1,1:n) - 50.0 ).^2                       ...
       + ( point(2,1:n) -  0.0 ).^2 <= 1600.0 );
  
  return
end
