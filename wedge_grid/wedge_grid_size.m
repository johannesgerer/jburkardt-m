function ng = wedge_grid_size ( n )  

%*****************************************************************************80
%
%% WEDGE_GRID_SIZE counts the points in a grid of the unit wedge in 3D.
%
%  Discussion:
%
%    The interior of the unit wedge in 3D is defined by the constraints:
%      0 <= X
%      0 <= Y
%           X + Y <= 1
%     -1 <= Z <= +1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%    0 <= N.
%
%    Output, integer NG, the number of grid points.
%
  ng = ( n + 1 ) * ( ( n + 1 ) * ( n + 2 ) ) / 2;

  return
end
