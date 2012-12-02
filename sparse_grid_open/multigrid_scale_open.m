function grid_index = multigrid_scale_open ( dim_num, order_nd, level_max, ...
  level_1d, grid_index )

%*****************************************************************************80
%
%% MULTIGRID_SCALE_OPEN renumbers a grid as a subgrid on a higher level.
%
%  Discussion:
%
%    This routine takes a grid associated with a given value of
%    LEVEL, and multiplies all the indices by a power of 2, so that
%    the indices reflect the position of the same points, but in
%    a grid of level LEVEL_MAX.
%
%    For an open grid, going from one level to the next, a set of indices
%    will be rescaled by 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer ORDER_ND, the number of points in the grid.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Input, integer LEVEL_1D(DIM_NUM), the level in each dimension.
%
%    Input, integer GRID_INDEX(DIM_NUM,POINT_NUM), the index
%    values for each grid point, based in the level for which the grid 
%    was generated.
%
%    Output, integer GRID_INDEX(DIM_NUM,POINT_NUM), the index
%    values for each grid point, appropriate for the grid as a subgrid 
%    of a grid of level LEVEL_MAX.
%
  for dim = 1 : dim_num

    factor = 2^( level_max - level_1d(dim) );

    grid_index(dim,1:order_nd) = grid_index(dim,1:order_nd) * factor;

  end

  return
end
