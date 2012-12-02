function [ grid_weight, grid_point ] = monte_carlo ( dim_num, point_num  )

%*****************************************************************************80
%
%% MONTE_CARLO returns Monte Carlo abscissas and weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Output, real GRID_WEIGHT(POINT_NUM), the weights for the points.
%
%    Output, real GRID_POINT(POINT_NUM), randomly chosen points in the
%    unit hypercube.
%
  grid_point = rand ( dim_num, point_num );

  grid_weight(1:point_num) = 1.0 / point_num;

  return
end
