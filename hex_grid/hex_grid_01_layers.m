function layers = hex_grid_01_layers ( nodes_per_layer )

%*****************************************************************************80
%
%% HEX_GRID_01_LAYERS computes the unit square hex grid column width.
%
%  Discussion:
%
%    This routine determines the value of LAYERS, the number of
%    layers, from the fundamental hexagonal grid parameter NODES_PER_LAYER.
%
%    A hexagonal grid is defined in the unit square [0,1] x [0,1].
%
%    All nodes of the grid lie on one of LAYERS horizontal lines.
%    The first of these lines is the X axis, and each successive
%    line is HY units higher.
%
%    On all the odd numbered lines, there are NODES_PER_LAYER points,
%    equally spaced from 0 to 1, with a spacing of HX.
%
%    On the even numbered lines, there are NODES_PER_LAYER-1 points,
%    whose values are the midpoints of successive intervals on
%    an odd numbered line.  (The grid is staggered).
%
%    HY = HX * sqrt ( 3 ) / 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODES_PER_LAYER, the number of grid points on the first
%    horizontal layer of points.
%
%    Output, integer LAYERS, the number of horizontal layers.
%
  if ( nodes_per_layer < 1 )

    layers = 0;

  elseif ( nodes_per_layer == 1 )

    layers = 1;

  else

    hx = 1.0 / ( nodes_per_layer - 1 );
    hy = sqrt ( 3.0 ) * hx / 2.0;
    layers = 1 + floor ( 1.0 / hy );

  end

  return
end
