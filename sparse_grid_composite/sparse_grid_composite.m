function [ grid_weight, grid_point ] = sparse_grid_composite ( dim_num, ...
  level_max, point_num  )

%*****************************************************************************80
%
%% SPARSE_GRID_COMPOSITE computes a sparse grid of composite rules.
%
%  Discussion:
%
%    This program computes a quadrature rule and writes it to a file.
%
%    The quadrature rule is associated with a sparse grid derived from
%    a Smolyak construction using a closed 1D quadrature rule. 
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the level that defines the Smolyak grid.
%    * the closed 1D quadrature rule (composite of 1 point rules).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, controls the size of the final sparse grid.
%
%    Input, integer POINT_NUM, the number of points in the grid, as determined
%    by SPARSE_GRID_COMPOSITE_SIZE.
%
%    Output, real GRID_WEIGHTS(POINT_NUM), the weights.
%
%    Output, real GRID_POINTS(DIM_NUM,POINT_NUM), the points.
%

%
%  Determine the index vector, relative to the full product grid,
%  that identifies the points in the sparse grid.
%
  grid_index = sparse_grid_composite_index ( dim_num, level_max, point_num );
%
%  Compute the physical coordinates of the abscissas.
%
  if ( 0 == level_max )
    order_max = 1;
  else
    order_max = 2^level_max + 1;
  end

  for point = 1 : point_num
    for dim = 1 : dim_num
      grid_point(dim,point) = ... 
        composite_abscissa ( order_max, grid_index(dim,point) + 1 );
    end
  end
%
%  Gather the weights.
%
  grid_weight = sparse_grid_composite_weights ( dim_num, level_max, point_num, ...
    grid_index );

  return
end
