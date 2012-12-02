function inside = p12_inside ( m, n, point )

%*****************************************************************************80
%
%% P12_INSIDE reports if a point is inside the region in problem 12.
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
  inside(1:n) =                                          ...
       ( 0.000 <= point(1,1:n) & point(1,1:n) <= 0.500 & ...
         0.000 <= point(2,1:n) & point(2,1:n) <= 1.000 ) ...
    |                                                    ...
       ( 0.500 <= point(1,1:n) & point(1,1:n) <= 0.625 & ...
         0.250 <= point(2,1:n) & point(2,1:n) <= 0.375 ) ...
    |                                                    ...
       ( 0.625 <= point(1,1:n) & point(1,1:n) <= 1.000 & ...
         0.000 <= point(2,1:n) & point(2,1:n) <= 1.000 ); 
   
  return
end
