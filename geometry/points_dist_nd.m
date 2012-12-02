function dist = points_dist_nd ( dim_num, p1, p2 )

%*****************************************************************************80
%
%% POINTS_DIST_ND finds the distance between two points in ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, real P1(DIM_NUM), P2(DIM_NUM), the coordinates of two points.
%
%    Output, real DIST, the distance between the points.
%
  dist = sqrt ( sum ( ( p1(1:dim_num) - p2(1:dim_num) ).^2 ) );

  return
end
