function point_num = sphere_cubed_grid_point_count ( n )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_POINT_COUNT counts the points in a cubed sphere grid.
%
%  Discussion:
%
%    For a value of N = 3, for instance, each of the 6 cube faces will
%    be divided into 3 sections, so that a single cube face will have
%    (3+1)x(3+1) points:
%
%      X---X---X---X
%      | 1 | 4 | 7 |
%      X---X---X---X
%      | 2 | 5 | 8 |
%      X---X---X---X
%      | 3 | 6 | 9 |
%      X---X---X---X
%
%    The number of points is simply (N+1)^3 - (N-1)^3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of sections into which each face of
%    the cube is to be divided.
%
%    Output, integer POINT_NUM, the number of points.
%
  point_num = ( n + 1 )^3 - ( n - 1 )^3;

  return
end
