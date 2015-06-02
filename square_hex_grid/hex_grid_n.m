function n = hex_grid_n ( nodes_per_layer, box )

%*****************************************************************************80
%
%% HEX_GRID_N computes the number of coordinate box hex grid points.
%
%  Discussion:
%
%    This routine determines the value of N, the number of
%    hex grid points, from the fundamental hexagonal grid
%    parameter NODES_PER_LAYER.
%
%    A hexagonal grid is defined in the coordinate box [A,B] x [C,D].
%
%    All nodes of the grid lie on one of LAYERS horizontal lines.
%    The first of these lines is from (A,C) to (B,C), and each
%    successive line is HY units higher.
%
%    On all the odd numbered lines, there are NODES_PER_LAYER points,
%    equally spaced from A to B, with a spacing of HX.
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
%    Input, real BOX(2,2), the values of A, B, C and D
%    that define the coordinate box.
%
%    Output, integer N, the number of hex grid points.
%
  if ( nodes_per_layer < 1 )

    n = 0;

  elseif ( nodes_per_layer == 1 )

    n = 1;

  else

    layers = hex_grid_layers ( nodes_per_layer, box );

    n = nodes_per_layer       * floor ( ( layers + 1 ) / 2 ) + ...
      ( nodes_per_layer - 1 ) * floor ( ( layers     ) / 2 );

  end

  return
end
